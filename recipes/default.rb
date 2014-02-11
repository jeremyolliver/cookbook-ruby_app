# Encoding: utf-8
#
# Cookbook Name:: ruby_app
# Recipe:: default
#
# Copyright 2014, Jeremy Olliver
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install specified rubies
include_recipe 'ruby_build'

node['rubies'].each do |ruby_version_string, is_enabled|
  if is_enabled
    build_environment_options = RubyAppHelpers.environment_options
    # install and compile ruby
    ruby_build_ruby ruby_version_string do
      environment(build_environment_options)
      prefix_path "/opt/rubies/#{ruby_version_string}"
    end

    # Install bundler
    gem_package "ruby-#{ruby_version_string}-bundler" do
      package_name 'bundler'
      version      node['ruby']['bundler']['version']
      gem_binary   "/opt/rubies/#{ruby_version_string}/bin/gem"
    end

  end
end

# Install chruby for ruby switching
include_recipe 'chruby'
