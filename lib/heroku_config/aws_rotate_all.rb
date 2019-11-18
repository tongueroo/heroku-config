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

      apps.each do |app, id_key_name, secret_key_name|
        options = @options.merge(
          app: app,
          id_key_name: id_key_name || 'AWS_ACCESS_KEY_ID',
          secret_key_name: secret_key_name || 'AWS_SECRET_ACCESS_KEY',
        )
        AwsRotate.new(options).run
      end
    end

    def apps
      lines = IO.readlines(@file).map(&:strip).reject(&:empty?)
      lines.map { |l| l.split(':') }
    end
    memoize :apps
  end
end
