require 'spec_helper'

describe Fog::ArubaCloud::Compute do
  describe 'it create the provider object' do

    before do
      @arguments = {
          :arubacloud_username => '',
          :arubacloud_password => '',
          :url 								 => ''
      }
      @service = Fog::ArubaCloud::Compute.new(@arguments)
    end

    it 'respond to #request' do
      assert_respond_to @service, :request
    end

    it 'is defined @arubacloud_username' do
      assert @service.instance_variable_defined?(:@arubacloud_username)
    end

    it 'is defined @arubacloud_password' do
      assert @service.instance_variable_defined?(:@arubacloud_password)
    end

    it 'respond to #servers' do
      assert @service.respond_to?(:servers)
    end

    it 'respond to #templates' do
      assert @service.respond_to?(:templates)
    end

    it 'respond to #loadbalancers' do
      assert @service.respond_to?(:loadbalancers)
    end

    it 'respond to #schedules' do
      assert @service.respond_to?(:schedules)
    end

    it 'respond to #disks' do
      assert @service.respond_to?(:disks)
    end

  end
end
