# -*-ruby-*-
require 'rubygems'
require 'rake'
require 'spec/rake/spectask'
require 'rest-client'

desc "Run unit tests"
task :default => :spec

desc "Run unit tests"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = Dir['**/*_spec.rb']
  t.spec_opts = lambda do
    IO.readlines(File.join(File.dirname(__FILE__), 'spec', 'spec.opts')).map {|l| l.chomp.split " "}.flatten
  end
end

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