
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.birthday_mail.subject
  #
  def birthday_mail(user, template)
    mail to: user.email, 
    body: template, 
    subject: Group.find(user.group_id).subject, 
    bcc: "geburtstag@fruehstarter.net"
    
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
