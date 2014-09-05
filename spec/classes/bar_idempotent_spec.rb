require 'spec_helper'

describe "example::bar" do
  before { skip 'Known Issue, currently not working' }

  describe "first in-line hiera_data test with a" do
    let(:hiera_data) { { :bar_message => "a" } }
    it { should contain_notify("bar").with_message("a") }
  end

  describe "second in-line hiera_data test with b" do
    let(:hiera_data) { { :bar_message => "b" } }
    it { should contain_notify("bar").with_message("b") }
  end

end
