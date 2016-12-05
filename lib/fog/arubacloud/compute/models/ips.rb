#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/compute/models/ip'

module Fog
  module ArubaCloud
    class Compute

      class Ips < Fog::Collection
        model Fog::ArubaCloud::Compute::IP

        # Returns list of Ip Addresses
        # @return [Fog::ArubaCloud::Compute::Ips]
        # @raise [Fog::ArubaCloud::Errors::NotFound]
        def all
          data = service.get_purchased_ip_addresses
          objects = data['Value']
          load(objects)
        end

        # Returns a single IpAddress object
        # @param ip [String]
        # @return [Fog::ArubaCloud::Compute::IP]
        # @raise [Fog::ArubaCloud::Errors::NotFound]
        def get(ip)
          # TODO: Implement single item retrieve
        end

        # Returns list of Ip Addresses related to a Virtual Machine
        def filter_by_vmid(vmid)
          # TODO: Implement filter ip per ID
        end

        # Purchase a new IpAddress
        # @return [Hash] hash containing the response of the request
        # @raise [Fog::ArubaCloud::Errors::RequestError]
        def purchase
          self << new(service.purchase_ip['Value'])
        end

      end
    end
  end
end
