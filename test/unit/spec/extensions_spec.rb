# Encoding: utf-8

require_relative 'spec_helper'

describe 'ruby_app::extensions' do
  before { stub_resources }

  describe 'ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new(UBUNTU_OPTS).converge(described_recipe) }

    it 'should install xml libs' do
      %w(libxml2-dev libxslt-dev).each do |package_name|
        expect(chef_run).to install_package(package_name)
      end
    end

    it 'should install imagemagick libs' do
      %w(imagemagick libmagickwand-dev).each do |package_name|
        expect(chef_run).to install_package(package_name)
      end
    end

  end

  describe 'centos' do
    let(:chef_run) { ChefSpec::Runner.new(CENTOS_OPTS).converge(described_recipe) }

    it 'should install rhel packages' do
      %w(libxml2-devel libxslt-devel).each do |package_name|
        expect(chef_run).to install_package(package_name)
      end
    end

    it 'should install imagemagick libs' do
      %w(ImageMagick ImageMagick-devel).each do |package_name|
        expect(chef_run).to install_package(package_name)
      end
    end

  end
end
