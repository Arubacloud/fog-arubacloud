require File.expand_path('spec/spec_helper')
require 'fog/arubacloud/compute/models/templates'

describe Fog::ArubaCloud::Compute::Templates do
  subject { Fog::ArubaCloud::Compute::Templates.new }

  it 'should be a collection of Template' do
    subject.model.must_equal(Fog::ArubaCloud::Compute::Template)
  end

  it 'should respond to #all' do
    subject.must_respond_to :all
  end

  it 'should respond to #get_hypervisor' do
    subject.must_respond_to :get_hypervisor
  end



end