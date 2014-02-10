# Encoding: utf-8

require_relative 'spec_helper'
require_relative 'matchers'

describe 'ruby_app::default' do
  before do
    stub_resources
    stub_command('git --version >/dev/null').and_return('1.8.2')
  end

  describe 'ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new(UBUNTU_OPTS).converge(described_recipe) }
    let(:default_rubies) { ['2.0.0-p353'] }

    it 'should install chruby' do
      expect(chef_run).to include_recipe('chruby::default')
      expect(chef_run).to include_recipe('ruby_build::default')
      expect(chef_run).to render_file('/etc/profile.d/chruby.sh')
    end

    it 'should install rubies' do
      expect(chef_run).to install_package('make') # pre-req packages should be installed
      default_rubies.each do |ruby_version|
        expect(chef_run).to install_ruby_build_ruby(ruby_version)
      end
    end

  end

end
