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
        def get_shared_storage
          body = self.body('GetSharedStorages')
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'GetSharedStorages', 'GetSharedStorages Error')
          }
          Fog::Logger.debug("GetSharedStorages time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # get_shared_storage

        class Mock
          def get_shared_storage
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # get_shared_storage
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
