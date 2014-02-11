# Encoding: utf-8

# Helper methods encapsulating logic that will be used in the recipe
module RubyAppHelpers
  # This ensures that if the Chef::Config[:http_proxy] or Chef::Config[:https_proxy]
  # options are set, that they will be included in the environment_options returned
  # and set into the currently running chef ruby ENV variables
  def self.environment_options
    opts = {}
    [:http_proxy, :https_proxy].each do |config_opt|
      setting = Chef::Config[config_opt]
      if setting
        ENV[config_opt.to_s.upcase] = setting
        opts[config_opt.to_s] = setting
      end
    end
    opts
  end

  def self.gem_options(default_options = '')
    default_options << "--http-proxy=#{Chef::Config[:http_proxy]}" if Chef::Config[:http_proxy]
    default_options
  end
end
