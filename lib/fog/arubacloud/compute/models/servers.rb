# coding: utf-8
#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/compute/models/server'


module Fog
  module ArubaCloud
    class Compute
      class Servers < Fog::Collection
        model Fog::ArubaCloud::Compute::Server

        # Returns list of servers
        # @return [Fog::ArubaCloud::Compute::Servers] Retrieves a list servers.
        # @raise [Fog::ArubaCloud::Compute::NotFound]
        # @note The filter parameter on the method is just to maintain compatibility with other providers that support
        #       filtering.
        def all(filters = [])
          data = service.get_servers
          objects = data['Value']
          load(objects)
        end

        # Retrieves server
        # @param [String] server_id for server to be returned.
        # @return [Fog::ArubaCloud::Compute::Server]
        def get(server_id)
          data = service.get_server_details(server_id)
          objects = data['Value']
          msg = "Fog::ArubaCloud::Compute::Servers.get 'objects' must be an hash, actually is: #{objects.class} #{objects.to_yaml}"
          Fog::Logger.debug(msg)
          raise Fog::ArubaCloud::Errors::BadObjectType.new("#{msg}") unless objects.instance_of? Hash
          new(objects)
        end
      end
    end
  end
end
