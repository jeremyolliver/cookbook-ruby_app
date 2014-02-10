# ruby_app Changelog

## v0.1.0

Initial release of ruby_app.

Features:

* installs rubies into `/opt/rubies`
* installs ruby `2.0.0-p353` by default, add or change versions via attributes
* installs bundler into those rubies
* provides [chruby](https://github.com/postmodern/chruby) for ruby switching
* uses `ruby_build` for ruby installation
* optional recipe `ruby_app::extensions` installs development headers for xml and imagemagick
* Test suite of unit and integration tests

- - -
Authors: Jeremy Olliver
