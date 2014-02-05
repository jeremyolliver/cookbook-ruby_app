# Encoding: utf-8
name             'ruby_app'
maintainer       'Jeremy Olliver'
maintainer_email 'jeremy.olliver@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures ruby_app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "chruby"
depends "ruby_build"

recommends "yum"
recommends "apt"

['ubuntu', 'debian', 'centos', 'rhel'].each do |os|
  supports os
end

recipe "ruby_app::default"
recipe "ruby_app::extensions"
