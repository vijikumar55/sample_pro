class Devise::RegistrationController < ApplicationController
  
   def new
    resource = build_resource({})
    respond_with_navigational(resource){ render_with_scope :new }
  end


end
