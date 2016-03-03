#
# Cookbook Name:: motd_cr
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'test::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(step_into: 'motd')
      runner.converge(described_recipe)
    end

    it 'renders /etc/motd' do
      expect(chef_run).to render_file('/etc/motd').with_content('Hello')
    end
  end
end
