# Encoding: utf-8

require_relative 'spec_helper'

describe 'extensions' do

  describe 'xml-packages' do

    describe command('xml2-config --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end

    describe command('xslt-config --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end

    describe 'nokogiri gem' do
      let(:nokogiri_installation) { command('/opt/chef/embedded/bin/gem install nokogiri') }

      it 'should install' do
        expect(nokogiri_installation).to return_exit_status 0
        expect(nokogiri_installation).to return_stdout(/Successfully installed nokogiri/)
      end
    end

  end

  describe 'image-magick' do

    describe command('iconv --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+/) }
    end

    describe command('identify --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end

    describe command('convert --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end

    describe file('/usr/bin/identify') do
      it { should be_file }
      it { should be_executable }
    end

    describe 'rmagick gem' do
      # TODO: fix installation on centos - probably needs path specified
      let(:rmagick_install) { command('/opt/chef/embedded/bin/gem install rmagick') }

      it 'should install' do
        expect(rmagick_install).to return_exit_status 0
        expect(rmagick_install).to return_stdout(/Successfully installed rmagick/)
      end
    end

  end

end
