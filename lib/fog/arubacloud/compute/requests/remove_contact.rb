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
        def remove_contact(data)
          body = self.body('SetRemoveLoadBalancerContacts').merge(
              :request => {
                  :loadBalancerID => data[:id],
                  :LoadBalancerContactsID => data[:loadbalancercontactid]
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetRemoveLoadBalancerContacts', 'SetRemoveLoadBalancerContacts Error')
          }
          Fog::Logger.debug("SetRemoveLoadBalancerContacts time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end
        end # remove_contact

        class Mock
          def remove_contact
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # remove_contact
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
