module HerokuConfig
  class AwsRotate
    def initialize(options)
      @options = options
    end

    def run
      puts "AwsRotate#run"
    end
  end
end
