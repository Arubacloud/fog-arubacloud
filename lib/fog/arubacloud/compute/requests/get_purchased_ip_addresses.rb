# coding: utf-8
#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'fog/arubacloud/error'
require 'benchmark'

module Fog
  module ArubaCloud
    class Compute

      # noinspection RubyResolve
      class Real
        def get_purchased_ip_addresses
          body = self.body('GetPurchasedIpAddresses')
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'GetPurchasedIpAddresses', 'GetPurchasedIpAddresses Error')
          }
          Fog::Logger.debug("GetPurchasedIpAddresses time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Error::RequestError
          end
        end # get_purchased_ip_addresses
      end # Real

      class Mock
        def get_purchased_ip_addresses
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true,
              'Value' => [
                  {
                      'CompanyId' => 1,
                      'ProductId' => 20,
                      'ResourceId' => 96052,
                      'ResourceType' => 6,
                      'UserId' => 1856,
                      'Gateway' => '5.249.158.1',
                      'LoadBalancerID' => nil,
                      'ServerId' => nil,
                      'SubNetMask' => '255.255.255.0',
                      'Value' => '5.249.158.66'
                  }, {
                      'CompanyId' => 1,
                      'ProductId' => 20,
                      'ResourceId' => 96054,
                      'ResourceType' => 6,
                      'UserId' => 1856,
                      'Gateway' => '5.249.158.1',
                      'LoadBalancerID' => nil,
                      'ServerId' => nil,
                      'SubNetMask' => '255.255.255.0',
                      'Value' => '5.249.158.102'
                  }
              ]
          }
          response.body
        end # get_purchased_ip_addresses
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
