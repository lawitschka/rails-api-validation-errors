begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

Bundler::GemHelper.install_tasks

# If you want to make this the default task
task :default => :spec