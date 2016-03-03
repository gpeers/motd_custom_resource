require 'poise'

module MotdCookbook
  class Motd < Chef::Resource
    include Poise(fused: true)

    resource_name :motd
    property :message, kind_of: String, name_property: true

    action :create do
      file '/etc/motd' do
        content "#{new_resource.message}"
        mode '0644'
      end
    end
  end
end
