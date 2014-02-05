ruby_app Cookbook
==========================
This cookbook sets up a server ready to use in a common deployment environment.

This cookbook:

* installs a set of rubies globally to /opt/rubies (defined via attributes)
* Makes the bundler gem available, ready to install your application's dependencies
* by default, installs some common development packages required for some gem's extensions (xml for nokogiri, and imagemagick for image manipulation)
* Turn's on chruby's ruby auto switching for minimal configuration needed for application deployment

Requirements
------------


e.g.
#### packages
- `toaster` - ruby_app needs toaster to brown your bagel.

Attributes
----------

e.g.
#### ruby_app::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt></tt></td>
    <td>Hash</td>
    <td>A list of ruby versions, and a truthy value to mark which ones to install</td>
    <td><tt>{'1.9.3-p392' => true}</tt></td>
  </tr>
</table>

Usage
-----
#### ruby_app::default
TODO: Write usage instructions for each cookbook.

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

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `feature/add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Jeremy Olliver
