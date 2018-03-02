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
        # Delete a snapshot on a VM
        def delete_snapshot(id)
          body = self.body('SetEnqueueServerSnapshot').merge(
            {
              :ServerId => id ,  :SnapshotOperation => Fog::ArubaCloud::Compute::SNAPOPTYPE["Delete"]
            }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueServerSnapshot', 'Error while attempting to delete a snapshot.')
          }
          Fog::Logger.debug("SetEnqueueServerSnapshot time: #{time}")
          if response['Success']
            response_ext = response.merge( {  "Req" => "Delete" , "Id" => id })
            response_ext
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end
        end #Delete
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
