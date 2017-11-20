module ApplicationHelper

def resource_name

:profile

end

def resource

@resource ||= Profile.new

end

def devise_mapping

@devise_mapping ||= Devise.mappings[:profile]

end

end
