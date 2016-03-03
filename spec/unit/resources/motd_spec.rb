require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'
require 'poise_boiler/spec_helper'
require 'compat_resource'
#require_relative '../../../resources/motd'
require_relative '../../../libraries/motd'


describe 'motd' do
  step_into(:motd)
  before do
    recipe = double('Chef::Recipe')
    allow_any_instance_of(Chef::RunContext).to receive(:include_recipe).and_return([recipe])
  end

  let(:chefspec_options) { {platform: 'ubuntu', version: '14.04', log_level: :debug} }

  context '#action_create' do
    recipe do
      motd 'Hello'
    end

    it { is_expected.to render_file('/etc/motd') }
  end
end
