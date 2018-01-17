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
        def delete_shared_storage(data)
          body = self.body('SetEnqueueRemoveSharedStorage').merge(
              {
                  :SharedStorage => {
                      :storageId => data[:id]
                  }
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueRemoveSharedStorage', 'SetEnqueueRemoveSharedStorage Error')
          }
          Fog::Logger.debug("SetEnqueueRemoveSharedStorage time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # edit_shared_storage

        class Mock
          def edit_shared_storage
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # edit_shared_storage
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
