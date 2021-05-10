class Friend < ApplicationRecord
    belongs_to   :user
    validates  :name, length:  {maximum: 30}, presence:   true
    validates  :email, length:  {maximum: 30}, presence:   true
    
    def self.search(search)
	where("name Like ?", "%#{search}%") #checks if the name field matches search
    end

    
end
