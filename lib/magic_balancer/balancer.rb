require 'socket'

class MagicBalancer
  class << self
    def get_ip(url)
      @counter = rand(0xffff)
      @ip_list = get_ip_list(url)
      @ip_list[@counter % @ip_list.size]
    end

    def get_ip_list(url)
      Socket::getaddrinfo(url, 'http', nil, Socket::SOCK_STREAM).map {|a, p, n, ip| ip}
    end
  end

  def initialize(url)
    @counter = rand(0xffff)
    @ip_list = MagicBalancer::get_ip_list(url)
  end

  def get_ip
    @counter += 1
    @ip_list[@counter % @ip_list.size]
  end
end