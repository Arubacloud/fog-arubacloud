# coding: utf-8
#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'

module Fog
  module ArubaCloud
    class Compute
      class Real
        def purchase_ip
          body = self.body('SetPurchaseIpAddress')
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetPurchaseIpAddress', 'SetPurchaseIpAddress Error')
          }
          Fog::Logger.debug("SetPurchaseIpAddress time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new("Error purchasing new ip. Error: \n#{response}")
          end
        end # purchase_ip
      end # Real

      class Mock
        def purchase_ip
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'ExceptionInfo' => nil,
            'ResultCode' => 0,
            'ResultMessage' => nil,
            'Success' => true,
            'Value' => {
              'CompanyId' => 1,
              'ProductId' => 20,
              'ResourceId' => 96034,
              'ResourceType' => 6,
              'UserId' => 1856,
              'Gateway' => '5.249.158.1',
              'LoadBalancerID' => nil,
              'ServerId' => nil,
              'SubNetMask' => '255.255.255.0',
              'Value' => '5.249.158.23'
            }
          }
          response.body
        end # purchase_ip
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
