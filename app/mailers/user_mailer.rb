class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.birthday_mail.subject
  #
  def birthday_mail(user)
    @user = user

    mail to: user.email, subject: "Alles Gute!", bcc: ["nils.kaden94@gmail.com", "#{@user.name} hat Geburtstag!"]
    ##sending a copy to geburtstag@fruehstarter.net
    @user.cc
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter.subject
  #
  def newsletter
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
