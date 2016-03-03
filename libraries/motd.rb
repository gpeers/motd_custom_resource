require 'poise'

class Motd < ChefCompat::Resource
include Poise(fused: true)

resource_name :motd

property :message, kind_of: String, name_property: true

# load_current_value not needed since using underlying core property
action :create do
  file '/etc/motd' do
    content "#{message}"
    mode '0644'
  end
end

end
