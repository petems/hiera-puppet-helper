source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'puppetlabs_spec_helper', :require => false
  gem 'rspec', '~> 2.99'
  gem 'rspec-puppet',
    :git => 'https://github.com/rodjek/rspec-puppet.git',
    :ref => '389f99ef666521fec1b4530fe69dc1ab84a060a8'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '>= 3.0.0', :require => false
end

gem 'hiera'
gem 'hiera-puppet', '>= 1.0'
