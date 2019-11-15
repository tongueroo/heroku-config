require 'open3'

module HerokuConfig
  class Config
    def initialize(app)
      @app = app
      check_heroku_cli_installed!
    end

    def get(name)
      sh "heroku config:get #{name} -a #{@app}"
    end

    def set(name, value)
      sh "heroku config:set #{name} #{value} -a #{@app}"
    end

  private
    def sh(command)
      puts "=> #{command}"
      stdout, stderr, status = Open3.capture3(command)
      out = stdout.strip
      unless status.success?
        puts "ERROR: #{stderr}".color(:red)
        if out.empty?
          puts "STDOUT: #{stdout}"
        end
        exit 1
      end
      out
    end

    def check_heroku_cli_installed!
      return if heroku_cli_installed?

      puts "The heroku cli is not installed. Please install the heroku cli: https://devcenter.heroku.com/articles/heroku-cli"
      exit 1
    end

    def heroku_cli_installed?
      system("type heroku > /dev/null 2>&1")
    end
  end
end
