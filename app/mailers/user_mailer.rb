class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
   
   def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => "vijik53@gmail.com", :subject => "Welcome to My Awesome Site")
  end
  
end
