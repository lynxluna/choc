require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:test) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => :test