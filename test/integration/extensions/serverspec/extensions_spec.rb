# Encoding: utf-8

require_relative 'spec_helper'

describe 'extensions' do

  describe 'xml-packages' do
    # TODO: should we install the nokogiri gem as well?
    describe command('xml2-config --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end
    describe command('xslt-config --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end
  end

  describe 'image-magick' do
    # TODO: should we install rmagick or mini_magick gem as well?
    describe command('iconv --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+/) }
    end

    describe command('identify --version') do
      it { should return_exit_status 0 }
      it { should return_stdout(/\d+\.\d+\.\d+/) }
    end

    describe file('/usr/bin/identify') do
      it { should be_file }
      it { should be_executable }
    end
  end

end
