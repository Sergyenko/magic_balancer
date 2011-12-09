require 'rubygems'
require 'bundler/setup'
require 'ruby-debug'

Spec::Runner.configure do |config|
  config.mock_with :flexmock
end

$basedir = File.expand_path('../..', __FILE__)
$libdir  = File.join($basedir, 'lib')
require File.join($libdir, 'magic_balancer')

def find_empirical_distribution(trials=2500)
  seen = {}

  trials.times do
    value = yield
    seen[value] ||= 0
    seen[value] += 1
  end

  seen
end

def test_random_distribution(trials=25000, &block)
  seen = find_empirical_distribution(trials, &block)
  should_be_chosen_fairly(seen,trials, MagicBalancer.get_ip_list("google.com").size)
end

def should_be_chosen_fairly(seen,trials,size)
  #Load should be evenly distributed
  chance = 1.0 / size
  seen.each_pair do |_, count|
    (Float(count) / Float(trials)).should be_close(chance, 0.025) #allow 5% margin of error
  end
end