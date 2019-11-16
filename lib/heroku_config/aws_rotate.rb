module HerokuConfig
  class AwsRotate < Base
    def initialize(options={})
      @options = options
      @app = options[:app]
    end

    def run
      key_id = config.get("AWS_ACCESS_KEY_ID")
      unless key_id
        puts "WARN: No AWS_ACCESS_KEY_ID found for #{@app.color(:green)} app. Exiting."
        exit 0
      end

      puts "key_id #{key_id}"
      aws_key = AwsKey.new(@options, key_id)
      aws_key.rotate
    end
  end
end
