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
        def get_scheduled_operations(datestart, dateend)
          body = self.body('GetScheduledOperations').merge({:dateStart => datestart, :dateEnd => dateend})
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'GetScheduledOperations', 'GetScheduledOperations Error')
          }
          Fog::Logger.debug("GetScheduledOperations time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # get_scheduled_operations

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
