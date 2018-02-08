class User < ApplicationRecord
    before_save {self.email = email.downcase }
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :birthday, presence: true
    
    def send_birthday_mail 
        UserMailer.birthday_mail(self).deliver_now
    end
end
