require 'open3'

module HerokuConfig
  class Config
    def initialize(app)
      @app = app
      check_heroku_cli_installed!
    end

    def get(name)
      return "fakevalue" if ENV['HEROKU_CONFIG_TEST']
      sh "heroku config:get #{name} -a #{@app}"
    end

    def set(*params)
      case params.size
      when 1 # Hash
        set_many(params.first)
      when 2 # 2 Strings
        set_one(name, value)
      else
        raise "ERROR: #{params.class} is a class that is not supported"
      end
    end

    def set_one(name, value)
      sh "heroku config:set #{name} #{value} -a #{@app}"
    end

    # Example:
    #
    #      set(a: 1, b: 2)
    #      =>
    #      heroku config:set a=1 b=2 -a APP
    #
    def set_many(hash)
      args = hash.map { |k,v| "#{k}=#{v}" }.join(' ')
      sh "heroku config:set #{args} -a #{@app}", include_stderr: true
    end

  private
    def sh(command, include_stderr: false)
      puts "=> #{command}"
      stdout, stderr, status = Open3.capture3(command)

      out = stdout.strip
      unless status.success?
        puts "ERROR: #{stderr}".color(:red)
        if stderr.empty?
          puts "STDOUT: #{stdout}"
        end
        exit 1
      end
      if include_stderr
        stderr + "\n" + out
      else
        out
      end
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
