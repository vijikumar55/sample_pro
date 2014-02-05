class ApplicationController < ActionController::Base
  protect_from_forgery
 # before_filter :authenticate_user!
  def authorize_for_user
    @user=Admin.find(session[:user_id].to_i) if session[:user_id]
    #status=@user.update_attributes( :visited_at=>Time.now) if @user
  end
  
end
