class LoginController < ApplicationController
  #before_filter :create_user_session, :only=>[:login]
  before_filter :authorize_for_user, :except=>[:index]
  layout 'main_menu'
  
  def login
    @admin=Admin.find(params[:user_name].to_i)
    render :layout =>false
  end
  
  def index
    render :layout =>false
  end
  
  def check
     name=params[:user][:user_name]
     password=params[:user][:pass_word]
     @valid_user=User.find_by_name(name)
     session[:user_id]=@valid_user.id if @valid_user
     if @valid_user
       render :action=>'login'
     else
     redirect_to :action=>'register'
     end
  end
  
  def register
  end
  
  def create
    if params[:user]
    @user=User.new(params[:user])
    @user.avathar = params[:upload][:datafile]
    raise @user.avathar.inspect
    if @user.save
      redirect_to :action =>'index'
     flash[:notice]="Register Succesfully."
    else
    flash[:notice]="Please try again after some time"
    end
    end
    end

end
