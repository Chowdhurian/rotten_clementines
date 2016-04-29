class UserMailer < ActionMailer::Base

  def delete_notification_email(user)
    @user = user
    mail(to: @user.email, subject: 'An admin has deleted your account')
  end
end
