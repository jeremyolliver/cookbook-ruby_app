module RubyAppHelpers

  # This ensures that if the Chef::Config[:http_proxy] or Chef::Config[:https_proxy]
  # options are set, that they will be included in the environment_options returned
  # and set into the currently running chef ruby ENV variables
  def self.environment_options
    opts = {}
    [:http_proxy, :https_proxy].each do |config_opt|
      if value = Chef::Config[config_opt]
        ENV[config_opt.to_s.upcase] = value
        opts[config_opt.to_s] = value
      end
    end
    opts
  end

end
