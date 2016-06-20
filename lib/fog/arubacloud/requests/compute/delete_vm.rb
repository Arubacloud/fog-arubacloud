#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module Compute
    class ArubaCloud

      class Real
        def delete_vm(id)
          body = self.body('SetEnqueueServerDeletion').merge({:ServerId => "#{id}"})
          options = {
              :http_method => :post,
              :method => 'SetEnqueueServerDeletion',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueServerDeletion time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new("Error Powering off the VM. Error: #{response}")
          end
        end # delete_vm
      end # Real

      class Mock
        def delete_vm(id)
          unless id
            raise Fog::ArubaCloud::Errors::InvalidParameterValue.new('InvalidParameterValue => Server ID must be specified.')
          end

          self.servers.select!{|s| s.id.eql?(id)}
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # delete_vm
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog