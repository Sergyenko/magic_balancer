task :env do
  require "rubygems"
  require "socket"
  require 'irb'
  require 'lib/magic_balancer'
end

desc "Fire up IRB console with preloaded environment"
task :console => :env do
  ARGV[0] = nil
  IRB.start
end