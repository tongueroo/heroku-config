module HerokuConfig
  class AwsRotateAll < Base
    def initialize(options={})
      @options = options
      @file = options[:file]
    end

    def run
      if ENV['HEROKU_CONFIG_TEST']
        puts "NOOP"
        return
      end

      apps.each do |app|
        AwsRotate.new(@options.merge(app: app)).run
      end
    end

    def apps
      IO.readlines(@file).map(&:strip).reject(&:empty?)
    end
    memoize :apps
  end
end
