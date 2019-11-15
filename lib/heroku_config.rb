$:.unshift(File.expand_path("../", __FILE__))
require "heroku_config/version"
require "memoist"
require "rainbow/ext/string"

require "heroku_config/autoloader"
HerokuConfig::Autoloader.setup

module HerokuConfig
  class Error < StandardError; end
end
