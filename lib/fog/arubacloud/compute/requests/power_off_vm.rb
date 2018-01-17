# coding: utf-8
#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'fog/arubacloud/error'

module Fog
  module ArubaCloud
    class Compute

      class Real
        def power_off_vm(id)
          body = self.body('SetEnqueueServerStop').merge({:ServerId => "#{id}"})
          response = nil
          time = Benchmark.realtime {
            response = request(body , 'SetEnqueueServerStop', 'SetEnqueueServerStop Error')
          }
          Fog::Logger.debug("SetEnqueueServerStop time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new("Error Powering off the VM. Error: #{response}")
          end
        end # power_off_vm
      end # Real

      class Mock
        def power_off_vm(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
