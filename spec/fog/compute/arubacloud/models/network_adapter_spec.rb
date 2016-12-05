require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/network_adapter'

describe Fog::ArubaCloud::Compute::NetworkAdapter do
  include ModelSetup

  let (:network_adapter_class) do
    class Fog::ArubaCloud::Compute::NetworkAdapter
      def self.read_identity
        instance_variable_get('@identity')
      end
    end
    Fog::ArubaCloud::Compute::NetworkAdapter
  end

  it 'should have an unique id' do
    network_adapter_class.read_identity.must_equal(:id)
  end

  it 'should have 6 attributes' do
    network_adapter_class.attributes.must_equal([
                                                    :id,
                                                    :mac_address,
                                                    :adapter_type,
                                                    :server_id,
                                                    :vlan,
                                                ])
  end

  it 'should have 1 many' do
    network_adapter_class.associations.must_equal({:ip_addresses => :ips})
  end
end