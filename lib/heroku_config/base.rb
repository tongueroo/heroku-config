module HerokuConfig
  class Base
    extend Memoist

    def config
      Config.new(@app)
    end
    memoize :config
  end
end
