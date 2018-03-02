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
        # Create a new snapshot of a VM
        def create_snapshot(id)
          body = self.body('SetEnqueueServerSnapshot').merge(
            {
              :ServerId => id ,  :SnapshotOperation => Fog::ArubaCloud::Compute::SNAPOPTYPE["Create"]
            }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueServerSnapshot', 'Error while attempting to create a snapshot.')
          }
          Fog::Logger.debug("SetEnqueueServerSnapshot time: #{time}")
          if response['Success']
            response_ext = response.merge( {  "Req" => "create" , "Id" => id })
            response_ext
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end

        end #Create_snapshot
      end #Real

      class Mock
        def create_snapshot
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # create snapshot
      end # Mock

    end # Compute
  end # ArubaCloud
end #Fog
