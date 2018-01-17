# coding: utf-8
#
# Author:: Dangleterre Michaël
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
      class Real
        def modify_loadbalancer(data)
          body = self.body('SetModifyLoadBalancer').merge(
              :LoadBalancerStartRequest => {
                  :loadBalancerID => data[:id],
                  :name => data[:name],
                  :healthCheckNotification => data[:healthchecknotification]
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetModifyLoadBalancer', 'SetModifyLoadBalancer Error')
          }
          Fog::Logger.debug("SetModifyLoadBalancer time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end
        end # modify_loadbalancer

        class Mock
          def modify_loadbalancer
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # modify_loadbalancer
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
