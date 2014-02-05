class Admins::SessionController < Devise::SessionsController

  def new
  end
  
  def create
    admin = Admin.find_by_email(params[:admin][:email])
    status=admin.valid_password?(params[:admin][:password])
    if  status
      UserMailer.welcome_email(admin).deliver
      session[:user_id]=admin.id
      redirect_to :controller=>'/login' ,:action=>'login', :user_name=>admin
     else
     flash[:notice]= "Please enter correct user name or password!!"
     render :action=>'new'    
    end
  end
  
  
  def destroy
      redirect_to :action=>'new'
      flash[:notice]= "signed out successfully" 
    end
end
