require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/network_adapters'

describe Fog::ArubaCloud::Compute::NetworkAdapters do
  # lazy loader (same as let(:subject) { Fog::ArubaCloud::Compute::NetworkAdapters })
  subject { Fog::ArubaCloud::Compute::NetworkAdapters }

  it 'should be a collection of NetworkAdapter' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::NetworkAdapter)
  end
end