# coding: utf-8
#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/error'

module Fog
  module ArubaCloud
    class Compute
      class Snapshot < Fog::Model
        CREATING = 'Create'
        APPLYING = 'Restore'
        DELETING = 'Delete'
        LIST = 'List'
        identity :id, :aliases => 'id'

        attribute :serverId, :aliases => 'serverId'
        attribute :snapshotOperation, :aliases => 'snapshotOperation'

        def initialize(attributes = {})
          @service = attributes[:service]
          if attributes[:name].nil?
            'operation impossible'
          end
        end

        def list
          requires :serverId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # List

        def create
          requires :serverId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # Create

        def apply
          requires :serverId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # Apply

        def delete
          requires :serverId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # Delete
      end
    end
  end
end
