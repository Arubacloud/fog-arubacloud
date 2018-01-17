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
        def disable_loadbalancer(data)
          body = self.body('SetEnqueueLoadBalancerPowerOff').merge(
              :LoadBalancerPowerOffRequest => {
                  :loadBalancerID => data[:id]
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetEnqueueLoadBalancerPowerOff', 'SetEnqueueLoadBalancerPowerOff Error')
          }
          Fog::Logger.debug("SetEnqueueLoadBalancerPowerOff time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end
        end # disable_loadbalancer

        class Mock
          def disable_loadbalancer
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # disable_loadbalancer
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
