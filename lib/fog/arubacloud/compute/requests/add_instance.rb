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
        def add_instance(data)
          body = self.body('SetEnqueueLoadBalancerAddInstances').merge(
              :Instances => {
                  :loadBalancerID => data[:id],
                  :Instances => [
                      {
                          :LoadBalancerInstance => [
                              {
                                  :IPAddress => data[:ipaddress]
                              }
                          ]
                      }
                  ]
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetEnqueueLoadBalancerAddInstances', 'SetEnqueueLoadBalancerAddInstances Error')
          }
          Fog::Logger.debug("SetEnqueueLoadBalancerAddInstances time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end
        end # add_instance

        class Mock
          def add_instance
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # add_instance
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
