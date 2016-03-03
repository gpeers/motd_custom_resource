if defined?(ChefSpec)
  def create_motd(message)
    ChefSpec::Matchers::ResourceMatcher.new(:motd, :create, message)
  end
end
