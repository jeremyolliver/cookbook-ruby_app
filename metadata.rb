# Encoding: utf-8
name             'ruby_app'
maintainer       'Jeremy Olliver'
maintainer_email 'jeremy.olliver@gmail.com'
license          'Apache 2.0'
description      'Installs rubies into /opt/rubies and chruby along with bundler'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "chruby"
depends "ruby_build"

recommends "yum"
recommends "apt"

['ubuntu', 'debian', 'centos', 'rhel'].each do |os|
  supports os
end

recipe "ruby_app::default",    "Installs ruby"
recipe "ruby_app::extensions", "Installs development headers for common ruby libraries with c-extensions"

attribute 'rubies',
  :display_name => 'ruby versions',
  :description => 'the ruby versions to install',
  :type => 'hash',
  :recipes => ['ruby_app::default'],
  :default => { '2.1.0' => true }

attribute 'ruby/bundler/version',
  :display_name => 'bundler version',
  :description => 'the version of bundler to install in each ruby',
  :type => 'string',
  :recipes => ['ruby_app::default'],
  :default => '1.5.2'
