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
        # Apply a snapshot on a VM
        def delete_snapshot(data)
          (service.servers).all.each do |server|
            id = server.id if (server.name).include? data[:name]
          end
          body = self.body('SetEnqueueServerSnapshot').merge(
              {
                  :Snapshot => {
                      :ServerId => id,
                      :SnapshotOperationTypes => 'Delete'
                  }
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueServerSnapshot', 'SetEnqueueServerSnapshot Error')
          }
          Fog::Logger.debug("SetEnqueueServerSnapshot time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end
        end #Apply
      end #Real

      class Mock
        def delete_snapshot
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end #delete snapshot
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
