require 'socket'

class MagicBalancer
  class << self
    def get_ip(url)
      @counter = rand(0xffff)
      @endpoints = get_ip_list(url)
      @endpoints[@counter % @endpoints.size]
    end

    def get_ip_list(url)
      Socket::getaddrinfo(url, 'http', nil, Socket::SOCK_STREAM).map {|a, p, n, ip| ip}
    end
  end

  def initialize(url)
    @counter = rand(0xffff)
    @endpoints = MagicBalancer::get_ip_list(url)
  end

  def get_ip
    @counter += 1
    @endpoints[@counter % @endpoints.size]
  end
end