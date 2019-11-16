module HerokuConfig
  class AwsKey < Base
    include AwsServices
    class MaxKeysError < StandardError; end

    def initialize(options, access_key_id)
      @options, @access_key_id = options, access_key_id
      @app = options[:app]
    end

    def rotate
      resp = iam.get_access_key_last_used(
        access_key_id: @access_key_id,
      )

      user_name = resp.user_name
      message = "Updating access key for user: #{user_name}"
      message = "NOOP: #{message}" if @options[:noop]
      puts message.color(:green)
      return false if @options[:noop]

      check_max_keys_limit!(user_name)
      new_key, new_secret = create_access_key(user_name)

      update_heroku_config(new_key, new_secret)
      # update_aws_credentials_file(key.access_key_id, key.secret_access_key)
      # delete_old_access_key
      # patience_message
      # aws_environment_variables_warning
      # true
    end

    def update_heroku_config(new_key, new_secret)
      out = config.set(
        "AWS_ACCESS_KEY_ID" => new_key,
        "AWS_SECRET_ACCESS_KEY" => new_secret,
      )
      puts out
    end

    # Returns:
    #
    #   #<struct Aws::IAM::Types::AccessKey
    #     user_name="tung",
    #     access_key_id="AKIAXZ6ODJLQUU6O3FD2",
    #     status="Active",
    #     secret_access_key="8eEnLLdR7gQE9fkFiDVuemi3qPf3mBMXxEXAMPLE",
    #     create_date=2019-08-13 21:14:35 UTC>>
    #
    def create_access_key(user_name)
      puts "create_access_key user_name #{user_name.inspect}"
      resp = iam.create_access_key(
        user_name: user_name,
      )
      access_key = resp.access_key
      key, secret = access_key.access_key_id, access_key.secret_access_key
      puts "Created new access key: #{key}"
      [key, secret]
    end

  private
    # Check if there are 2 keys, cannot rotate if there are 2 keys already.
    # Raise error if there are 2 keys.
    # Returns false if not at max limit
    MAX_KEYS = 2
    def check_max_keys_limit!(user_name)
      resp = iam.list_access_keys(user_name: user_name)
      return false if resp.access_key_metadata.size < MAX_KEYS # not at max limit

      puts "ERROR: There are already 2 access keys for user: #{user_name.color(:green)}".color(:red)
      raise MaxKeysError
    end
  end
end
