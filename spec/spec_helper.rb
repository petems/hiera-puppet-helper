require 'puppetlabs_spec_helper/module_spec_helper'
require File.join(File.dirname(__FILE__), '../lib/hiera-puppet-helper')

RSpec.configure do |c|
  c.order = "random"
end

shared_context "default values" do
  let(:hiera_data) { { :cache_bust => Time.now } }
end