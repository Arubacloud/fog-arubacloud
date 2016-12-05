#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/compute/models/sharedstorage'

module Fog
  module ArubaCloud
    class Compute
      class SharedStorages < Fog::Collection
        model Fog::ArubaCloud::Compute::SharedStorage
      end
    end
  end
end