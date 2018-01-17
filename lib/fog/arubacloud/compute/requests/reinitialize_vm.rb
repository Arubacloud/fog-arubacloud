# coding: utf-8
#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'benchmark'

module Fog
  module ArubaCloud
    class Compute
      class Real
        # Reinitialize a Smart VM
        # @param id [String] the id of the virtual machine to reinitialize
        # @return response [Excon::Response]
        def reinitialize_vm(id)
          body = self.body('SetEnqueueReinitializeServer').merge({ :ServerId => id })
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetEnqueueReinitializeServer', 'SetEnqueueReinitializeServer Error')
          }
          Fog::Logger.debug("SetEnqueueReinitializeServer time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError
          end
        end # reinitialize_vm
      end # Real

      class Mock
        def reinitialize_vm(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # reinitialize_vm
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
