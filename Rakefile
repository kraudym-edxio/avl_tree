require "minitest/test_task"

Minitest::TestTask.create(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.warning = false
  t.test_globs = ["test/**/*_test.rb"]
end

task :environment do
  require_relative 'setup'
end

task :console => [:environment] do
  require 'irb'
  ARGV.clear
  IRB.start
end

task :default => :test
