module HerokuConfig
  class CLI < Command
    class_option :verbose, type: :boolean
    class_option :noop, type: :boolean

    desc "aws-rotate APP", "Rotates AWS key for app"
    long_desc Help.text(:aws_rotate)
    def aws_rotate(app)
      AwsRotate.new(options.merge(app: app, cli: true)).run
    end

    desc "aws-rotate-all FILE", "Rotates AWS key for list of apps"
    long_desc Help.text(:aws_rotate_all)
    def aws_rotate_all(file)
      AwsRotateAll.new(options.merge(file: file)).run
    end

    desc "completion *PARAMS", "Prints words for auto-completion."
    long_desc Help.text("completion")
    def completion(*params)
      Completer.new(CLI, *params).run
    end

    desc "completion_script", "Generates a script that can be eval to setup auto-completion."
    long_desc Help.text("completion_script")
    def completion_script
      Completer::Script.generate
    end

    desc "version", "prints version"
    def version
      puts VERSION
    end
  end
end
