class UserNotifierMailer < ApplicationMailer
   default :from => 'employers@nextacademy.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'We received your interest to hire our grads' )
  end
end
