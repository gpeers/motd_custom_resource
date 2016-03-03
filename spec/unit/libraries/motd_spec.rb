require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'
require 'poise_boiler/spec_helper'
require_relative '../../../libraries/motd'

describe MotdCookbook::Motd do
  step_into(:motd)
  let(:chefspec_options) { {platform: 'ubuntu', version: '14.04', log_level: :debug} }

  context 'create_motd' do
    recipe do
      motd 'Testing'
    end

    it { is_expected.to render_file('/etc/motd').with_content("Testing")}
  end
end
