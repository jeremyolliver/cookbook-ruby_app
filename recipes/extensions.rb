# Encoding: utf-8
#
# Cookbook Name:: ruby_app
# Recipe:: extensions
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

xml_handling_packages = value_for_platform(
  "default" => ["libxml2-dev", "libxslt-dev"],

  ["centos", "redhat", "scientific", "suse", "fedora", "amazon" ] =>
      { "default" => ["libxml2-devel","libxslt-devel"] },
  [ "freebsd" ] =>
      { "default" => ["libxml2","libxslt"] }
)

xml_handling_packages.each do |pkg|
  package pkg do
    action :install
  end
end

# imagemagick

if platform_family?("rhel", "fedora")
  package "ImageMagick"
elsif platform_family?("debian")
  package "imagemagick"
end

image_magick_dev_pkgs = value_for_platform(
  ["redhat", "centos", "fedora"] => { "default" => ["ImageMagick-devel"] },
  "debian" => { "default" => ["libmagickwand-dev"] },
  "ubuntu" => {
    "8.04" => ["libmagick9-dev"],
    "8.10" => ["libmagick9-dev"],
    "12.04" => ["libgvc5", "libmagickcore4-extra", "libmagickcore-dev", "libmagickwand-dev"],
    "default" => ["libmagickwand-dev"]
  }
)

image_magick_dev_pkgs.each do |pkg|
  package pkg
end
