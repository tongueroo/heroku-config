require "bundler/gem_tasks"
require "rspec/core/rake_task"

task default: :spec

RSpec::Core::RakeTask.new

require_relative "lib/heroku-config"
require "cli_markdown"
desc "Generates cli reference docs as markdown"
task :docs do
  mkdir_p "docs/_includes"
  CliMarkdown::Creator.create_all(cli_class: HerokuConfig::CLI, cli_name: "heroku-config")
end
