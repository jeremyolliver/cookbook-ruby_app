ruby_app cookbook
==========================
This cookbook sets up a server ready to use in a common deployment environment.

This cookbook:

* installs rubies into `/opt/rubies` configurable via `node['rubies']`
* installs bundler into each of those rubies
* provides [chruby](https://github.com/postmodern/chruby) for ruby switching
* uses `ruby_build` for ruby installation
* optional recipe `ruby_app::extensions` installs development headers for xml and imagemagick
* Has a test suite of unit and integration tests

* installs a set of rubies globally to /opt/rubies (defined via attributes)
* Makes the bundler gem available, ready to install your application's dependencies
* by default, installs some common development packages required for some gem's extensions (xml for nokogiri, and imagemagick for image manipulation)
* Turn's on chruby's ruby auto switching for minimal configuration needed for application deployment

Requirements
------------

This cookbook depends on the `chruby` and `ruby_build` cookbooks. `yum` cookbook is recommended for rhel family platforms, and the `apt` cookbook is recomended for debian family platforms.

On Ubuntu 10.04 you will most likely need to run apt-get as the first thing you do. It is recommended that the apt cookbook is at, or near the start of your run_list.

Attributes
----------

#### ruby_app::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>rubies</tt></td>
    <td>Hash</td>
    <td>A list of ruby versions, and a truthy value to mark which ones to install</td>
    <td><tt>{'2.0.0-p353' => true}</tt></td>
  </tr>
  <tr>
    <td><tt>ruby/bundler/version</tt></td>
    <td>String</td>
    <td>The version of bundler to install for each ruby</td>
    <td><tt>1.5.2</tt></td>
  </tr>
</table>

Usage
-----
#### ruby_app::default

e.g.
Just include `ruby_app` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ruby_app]"
  ]
}
```

#### ruby_app::extensions (optional)

If you will also be using imagemagick for the `Rmagick` or `mini_magick` gems, or `nokogiri` for XML parsing, then you should also include this optional cookbook in your run list
to install the necessary packages

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `feature/add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: Apache 2.0

Authors: Jeremy Olliver
