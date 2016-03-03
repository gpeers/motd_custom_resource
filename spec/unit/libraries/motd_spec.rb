#
# DISREGARD THIS FILE FOR LEARNING ABOUT CUSTOM resources
#
require 'spec_helper'
require_relative '../../../libraries/motd'

describe MotdCookbook::Motd do
  step_into(:motd)
  let(:chefspec_options) { {platform: 'ubuntu', version: '14.04', log_level: :debug} }

  context 'create_motd' do
    recipe do
      motd 'Testing'
    end

    # the 'step_into' view
    it { is_expected.to render_file('/etc/motd').with_content("Testing")}

    # the external view
    it { is_expected.to create_motd('Testing').with_message("Testing")}
  end
end
