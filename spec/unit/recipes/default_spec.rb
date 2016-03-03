#
# Cookbook Name:: motd_cr
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# This cookbook as no default recipe, we test against the
# cookbook in test/fixtures/cookbooks/text

require 'spec_helper'

describe 'test::default' do
  context 'stepping into motd' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(step_into: 'motd')
      runner.converge(described_recipe)
    end

    it 'renders /etc/motd' do
      expect(chef_run).to render_file('/etc/motd').with_content('Hello')
    end

    it 'creates motd' do
      expect(chef_run).to create_motd('Hello').with_message(/Hello/)
    end
  end

  # How this would test when consumed externally
  context 'using motd resource' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new()
      runner.converge(described_recipe)
    end

    it 'creates motd' do
      expect(chef_run).to create_motd('Hello').with_message(/Hello/)
    end
  end
end
