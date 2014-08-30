require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :lib do
  sh "cd tester && make && cd .."
end

Cucumber::Rake::Task.new(:test) do |t|
  Rake::Task[:lib].invoke
  t.cucumber_opts = "features --format pretty"
end

task :default => :test

task :clean do
  sh "cd tester && make clean && cd .."
end
