require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/sharedstorages'

describe Fog::ArubaCloud::Compute::SharedStorages do
  subject { Fog::ArubaCloud::Compute::SharedStorages }

  it 'should be a collection of SharedStorage' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::SharedStorage)
  end
end