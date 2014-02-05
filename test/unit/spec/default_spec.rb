# Encoding: utf-8

require_relative 'spec_helper'

describe 'ruby_app::default' do
  before { stub_resources }
  describe 'ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'should install chruby' do
      expect(chef_run).to include_recipe('chruby::default')
      expect(chef_run).to render_file('/usr/local/chruby')
    end

    it 'should install ruby 2.0.0-p353' do
      pending('todo')
    end

  end
end
