require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/servers'

describe Fog::ArubaCloud::Compute::Servers do
  # lazy loader (same as let(:subject) { Fog::ArubaCloud::Compute::Servers })
  subject { Fog::ArubaCloud::Compute::Servers }

  it 'should be a collection of Servers' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::Server)
  end

  it 'respond to #disks' do
    subject.model.respond_to? :disks
  end
end