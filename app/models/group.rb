class Group < ApplicationRecord
    has_many :users
    
    validates :name, presence: true
    validates :subject, presence: true
    validates :content, presence: true
    
    def self.getOptionString
        stringy = "["
        @groups = Group.all
        @groups.each do |group|
            stringy += "['#{group.name}', #{group.id}],"
        end
        stringy.chomp!(",")
    end
    
    def self.check_all_groups
        Group.where(datum: Date.today).find_each do |group|
            group.users.all do |user|
                user.send_birthday_mail
            end
        end
    end
end
