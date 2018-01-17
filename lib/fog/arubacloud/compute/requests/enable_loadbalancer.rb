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
        def enable_loadbalancer(data)
          body = self.body('SetEnqueueLoadBalancerStart').merge(
              :LoadBalancerStartRequest => {
                  :loadBalancerID => data[:id]
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueLoadBalancerStart', 'SetEnqueueLoadBalancerStart Error')
          }
          Fog::Logger.debug("SetEnqueueLoadBalancerStart time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end
        end # enable_loadbalancer

        class Mock
          def enable_loadbalancer
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # enable_loadbalancer
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
