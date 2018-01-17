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
        def delete_scheduled_operation(operationid)
          body = self.body('SetRemoveServerScheduledOperation').merge({:operationid => operationid})
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetRemoveServerScheduledOperation', 'SetRemoveServerScheduledOperation Error')
          }
          Fog::Logger.debug("SetRemoveServerScheduledOperation time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # suspend_scheduled_operations

        class Mock
          def get_scheduled_operations
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # get_scheduled_operations
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
