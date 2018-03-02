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
        # Apply (restore) a snapshot on a VM
        def apply_snapshot(id)
          body = self.body('SetEnqueueServerSnapshot').merge(
            {
              :ServerId => id ,  :SnapshotOperation => Fog::ArubaCloud::Compute::SNAPOPTYPE["Restore"]
            }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueServerSnapshot', 'Error while attempting to restore a snapshot.')
          }
          Fog::Logger.debug("SetEnqueueServerSnapshot time: #{time}")
          if response['Success']
            response_ext = response.merge( {  "Req" => "restore" , "Id" => id })
            response_ext
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end

        end #Apply
      end #Real

      class Mock
        def apply_snapshot
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # apply snapshot
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
