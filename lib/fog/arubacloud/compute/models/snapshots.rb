# coding: utf-8
#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/compute/models/snapshot'

module Fog
  module ArubaCloud
    class Compute
      class Snapshots < Fog::Collection
        model Fog::ArubaCloud::Compute::Snapshot
        # Returns list of Ip Addresses
        # @return [Fog::ArubaCloud::Compute::Ips]
        # @raise [Fog::ArubaCloud::Errors::NotFound]
        def all
          # TODO: Implement single item retrieve
        end
        # Returns a single snapshot object
        def get
          # TODO: Implement single item retrieve
        end
      end
    end
  end
end
