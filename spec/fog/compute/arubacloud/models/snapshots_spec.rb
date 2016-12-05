require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/snapshots'

describe Fog::ArubaCloud::Compute::Snapshot do
  subject { Fog::ArubaCloud::Compute::Snapshots }

  it 'should be a collection of Snapshot' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::Snapshot)
  end

end