require 'spec_helper'

describe MagicBalancer do
  before(:each) do
    url = "google.com"
    result = [[0,0,0,1],[0,0,0,2],[0,0,0,3],[0,0,0,4],[0,0,0,5]]
    flexmock(Socket).should_receive(:getaddrinfo).with(url, 'http', nil, Socket::SOCK_STREAM).and_return(result)
    @balancer = MagicBalancer.new(url)
  end

  it 'chooses fairly' do
    test_random_distribution do
      @balancer.get_ip
    end
  end
end