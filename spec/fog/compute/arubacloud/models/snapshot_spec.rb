require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/snapshot'

describe Fog::ArubaCloud::Compute::Snapshot do
  include ModelSetup

  let (:snapshot_class) do
    class Fog::ArubaCloud::Compute::Snapshot
      def self.read_identity
        instance_variable_get('@identity')
      end
    end
    Fog::ArubaCloud::Compute::Snapshot
  end

  let(:service) { Object.new }
end