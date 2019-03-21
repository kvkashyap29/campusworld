class UserMailer < ActionMailer::Base
  default from: "kvkashyap1997@gmail.com"

  def password_changed(id)
    @user = User.find(id)
    mail to: @user.email, subject: "Your password has changed"
  end
end