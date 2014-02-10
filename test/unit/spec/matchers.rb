# ruby_build matchers
ChefSpec::Runner.define_runner_method(:ruby_build_ruby)

def install_ruby_build_ruby(resource)
  ChefSpec::Matchers::ResourceMatcher.new(:ruby_build_ruby, :install, resource)
end
