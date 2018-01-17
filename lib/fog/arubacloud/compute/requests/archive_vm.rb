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
        def archive_vm(data)
          (service.servers).all.each do |server|
            id = server.id if (server.name).include? data[:name] and (server.vm_type).include? 'pro'
          end
          body = self.body('SetEnqueueServerArchiviation').merge(
              {
                  :SetEnqueueServerArchiviation => {
                      :ServerId => id
                  }
              }
          )
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'SetEnqueueServerArchiviation', 'SetEnqueueServerArchiviation Error')
          }
          Fog::Logger.debug("SetEnqueueServerArchiviation time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end

        end # archive_vm
      end # Real

      class Mock
        def archive_vm
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # archive_vm
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
