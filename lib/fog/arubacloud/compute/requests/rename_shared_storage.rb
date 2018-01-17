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
        def rename_shared_storage(data)
          body = self.body('SetRenameSharedStorage').merge(
              {
                  :SharedStorage => {
                      :SharedStorageId => data[:id],
                      :SharedStorageName => data[:sharedstoragename]
                  }
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetRenameSharedStorage', 'SetRenameSharedStorage Error')
          }
          Fog::Logger.debug("SetRenameSharedStorage time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # rename_shared_storage

        class Mock
          def rename_shared_storage
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # rename_shared_storage
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
