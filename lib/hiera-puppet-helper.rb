require 'hiera-puppet-helper/version'
require 'hiera-puppet-helper/puppet'
require 'hiera-puppet-helper/rspec'
require 'rspec-puppet/support'
require 'hiera'

def hiera_stub
  config = Hiera::Config.load(hiera_config)
  config[:logger] = 'puppet'
  Hiera.new(:config => config)
end

RSpec.configure do |c|
  c.mock_framework = :rspec

  c.before(:each) do
    begin
      require 'puppet/indirector/hiera'
      Puppet::DataBinding::Hiera
    rescue Exception => e
      require 'puppet/indirector/data_binding/hiera'
      Puppet::DataBinding::Hiera
    end.stub(:hiera => hiera_stub)
    # Use this to debug
    #Puppet::Util::Log.level = :debug
    #Puppet::Util::Log.newdestination(:console)
  end

end

# Remove the caching of the catalog as otherwise changes in hiera data don't get
# reflected between different tests
module RSpec::Puppet::Support
  def build_catalog(*args)
    self.build_catalog_without_cache(*args)
  end
end

