require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/loadbalancers'

describe Fog::ArubaCloud::Compute::LoadBalancers do
  # lazy loader (same as let(:subject) { Fog::ArubaCloud::Compute::LoadBalancers })
  subject { Fog::ArubaCloud::Compute::LoadBalancers }

  it 'should be a collection of LoadBalancers' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::LoadBalancer)
  end

  it 'respond to #disks' do
    subject.model.respond_to? :disks
  end
end