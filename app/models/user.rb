class User < ApplicationRecord
    belongs_to :group
    
    before_save {self.email = email.downcase }
    
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :birthday, presence: true
    validates :group_id, presence: true
    #validates :female, presence: true
    
    def send_birthday_mail 
        puts "send to mailer"
        UserMailer.birthday_mail(self).deliver_now
    end
    
    def self.check_all
        User.where(birthday_string: Date.today.strftime("%m-%d")).find_each do |user|
            puts user.email
            user.send_birthday_mail ## really important not to run this twice lel
        end
    end
end
