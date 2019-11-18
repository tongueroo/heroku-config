module HerokuConfig
  module AwsKeyNameMap
    def id_key_name
      @options[:id_key_name] || "AWS_ACCESS_KEY_ID"
    end

    def secret_key_name
      @options[:secret_key_name] || "AWS_SECRET_ACCESS_KEY"
    end
  end
end
