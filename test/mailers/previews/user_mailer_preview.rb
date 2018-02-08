# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/birthday_mail
  def birthday_mail
    user = User.first
    UserMailer.birthday_mail(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/newsletter
  def newsletter
    UserMailer.newsletter
  end

end
