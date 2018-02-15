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
end
