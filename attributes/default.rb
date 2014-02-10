# Encoding: utf-8

default['ruby']['bundler']['version'] = '1.5.2'

# override these, by adding in new rubies, or setting the value of an existing
# ruby to false if you don't want it installed
default['rubies'] = {
  '2.0.0-p353' => true
  # '2.1.0'      => true
}
