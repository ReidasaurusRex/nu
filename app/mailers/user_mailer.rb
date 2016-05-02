class Mailers::UserMailer < ApplicationMailer
  default from: "allofus@nu.world"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Nu!")
  end
end
