class User < ApplicationRecord
    belongs_to :group
    
    #before_save {self.email = email.downcase}
    #before_save {self.birthday_string = self.birthday.to_s[5..9] }
    before_save :prepareData
    
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :birthday, presence: true
    validates :group_id, presence: true
    #validates :female, presence: true
    
    def send_birthday_mail 
        # get template
        template = Group.find(self.group_id).content

        puts "sent to mailer"
        UserMailer.birthday_mail(self, self.prepareTemplate(template)).deliver_now
    end
    
    def prepareTemplate (template)
        # get userdata into array format
        first = self.firstname
        last = self.lastname
        temp = self.female
        title = 'Frau'
        if temp == false
            title = "Herr"
        end
        userData = [title, first, last]
        
        identifiers = ['%title%', '%first%', '%last%']
        values = []
        
        # push the userData into values array, if identifier was used in template
        identifiers.each_with_index do |ident, i|
            if template.include?(ident)
                values.push(userData[i])
            else 
                values.push('')
            end
        end
        
        # replace identifiersr in template with userData
        values.each_with_index do |str, i| 
            match = template.split(identifiers[i])
            template = match.first << str << match.last
        end
        return template
    end
    
    def self.check_all_for_birthday
        User.where(birthday_string: Date.today.strftime("%m-%d")).find_each do |user|
            puts user.email
            user.send_birthday_mail ## really important not to run this twice lel
        end
    end
    
    def prepareData
        self.email = email.downcase
        self.birthday_string = self.birthday.to_s[5..9]
    end
end
