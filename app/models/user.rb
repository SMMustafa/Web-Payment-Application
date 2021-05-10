class User < ApplicationRecord  
    has_many    :friends
    has_many    :sent_payments, foreign_key: :sender_id, class_name: 'Payment' 
    has_many    :recieved_payments, foreign_key: :recipient_id, class_name: 'Payment' 
    before_save  {email.downcase  } #all emails are converted to lowercase before they are stored. This is referred to as a before filter.
    validates    :name,  presence:   true,   length: {maximum:  50}
    VALIDE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates    :email,  presence:   true,   length: {maximum:  150}, format:  {with:   VALIDE_EMAIL_REGEX},  uniqueness:  {case_sensitive:  false}

    has_secure_password
        # validates   :password, length:  {minimum:  4}
     
end
