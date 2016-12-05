require File.expand_path('spec/spec_helper')
require File.expand_path('lib/fog/arubacloud/compute/models/disks')

describe Fog::ArubaCloud::Compute::Disks do
  subject { Fog::ArubaCloud::Compute::Disks }

  it 'should be a collection of Disk' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::Disk)
  end

end