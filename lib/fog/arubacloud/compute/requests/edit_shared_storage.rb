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
        def edit_shared_storage(data)
          body = self.body('SetEnqueueModifySharedStorage').merge(
              {
                  :SharedStorage => {
                      :Quantity => data[:quantity],
                      :storageId => data[:id]
                  }
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request( body , 'SetEnqueueModifySharedStorage', 'SetEnqueueModifySharedStorage Error')
          }
          Fog::Logger.debug("SetEnqueueModifySharedStorage time: #{time}")
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
