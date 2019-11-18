module HerokuConfig
  class AwsRotate < Base
    include AwsKeyNameMap
    class MaxKeysError < StandardError; end

    def initialize(options={})
      @options = options
      @app = options[:app]
    end

    def run
      key_id = config.get(id_key_name)
      unless key_id
        puts "WARN: No #{id_key_name} found for #{@app.color(:green)} app."
        if @options[:cli]
          puts "Exiting"
          exit 0
        else
          return
        end
      end

      aws_key = AwsKey.new(@options, key_id)
      aws_key.rotate
    end
  end
end
