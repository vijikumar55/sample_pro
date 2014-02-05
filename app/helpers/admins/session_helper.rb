module Admins::SessionHelper
  
  def resource_name
    :admin
  end
  
  def resource_class
    devise_mapping.to
  end

  def resource
    @resource ||= Admin.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end
  
end
