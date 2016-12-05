require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/ips'

describe Fog::ArubaCloud::Compute::Ips do
  subject { Fog::ArubaCloud::Compute::Ips }

  it 'should be a collection of IP' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::IP)
  end

end