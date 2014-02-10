# Encoding: utf-8

require_relative 'spec_helper'

describe 'default' do
  let(:default_ruby_version) { '2.0.0-p353' }
  let(:bundler_version)      { '1.5.2' }

  describe 'ruby-build' do
    describe file('/usr/local/bin/ruby-build') do
      it { should be_file }
      it { should be_executable }
    end
  end

  describe 'chruby' do
    describe file('/usr/local/chruby') do
      it { should be_directory }
    end

    describe file('/usr/local/bin/chruby-exec') do
      it { should be_file }
      it { should be_executable }
    end

    describe file('/etc/profile.d/chruby.sh') do
      it { should be_file }
      # Apparently this doesn't need to be executable to get loaded
      # it { should be_executable }
    end

    describe 'chruby-exec switching' do
      subject { command("/usr/local/bin/chruby-exec #{default_ruby_version} -- ruby --version") }
      it { should return_stdout(/ruby #{default_ruby_version}/) }
    end

    # Ensure chruby.sh was loaded
    describe 'chruby.sh should be loaded' do
      subject { command("/bin/bash --login -c 'chruby #{default_ruby_version} && ruby --version'") }
      it { should return_stdout(/ruby #{default_ruby_version}/) }
    end

  end

  describe 'installed ruby' do
    describe 'ruby-executable' do
      subject { file("/opt/rubies/#{default_ruby_version}/bin/ruby") }
      it { should be_file }
      it { should be_executable }
    end
    describe 'ruby-version' do
      subject { command("/opt/rubies/#{default_ruby_version}/bin/ruby --version") }
      it { should return_stdout(/ruby #{default_ruby_version}/) }
    end
  end

  describe 'bundler' do
    describe 'bundler-executable' do
      subject { file("/opt/rubies/#{default_ruby_version}/bin/bundle") }
      it { should be_file }
      it { should be_executable }
    end
    describe 'bundler-version' do
      subject { command("/opt/rubies/#{default_ruby_version}/bin/bundle --version") }
      it { should return_stdout("Bundler version #{bundler_version}") }
    end
  end

end
