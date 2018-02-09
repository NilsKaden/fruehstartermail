class User < ApplicationRecord
    before_save {self.email = email.downcase }
    attr_accessor :birthday_string
    
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :birthday, presence: true
    attr_accesor :birthday_string
    
    def send_birthday_mail 
        puts "send to mailer"
        UserMailer.birthday_mail(self).deliver_now
    end
    
    def self.check_all
        ## im gonna do some bad practice coding here
        ## importing and checking every record in rails, instead of using a where statement
        ## to select with SQL.
        ## this will use far more ressources, but is good enough for testing,
        ## probably even for production
        
        User.where(birthday_string: Date.today.strftime("%d %m")).find_each do |user|
            puts user.email
            user.send_birthday_mail ## really important not to run this twice lel
        end
    end
end
