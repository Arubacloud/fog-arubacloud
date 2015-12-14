#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'

module Fog
  module Compute
    class ArubaCloud
      class Real
        def power_off_vm(id)
          body = self.body('SetEnqueueServerStop').merge({:ServerId => "#{id}"})
          power_off_options = {
              :http_method => :post,
              :method => 'SetEnqueueServerStop',
              :body => Fog::JSON.encode(body)
          }
          request(power_off_options)
        end
      end
    end
  end
end