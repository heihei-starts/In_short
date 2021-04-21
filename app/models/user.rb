class User < ApplicationRecord
 
  #コールバック関数
  before_save{ self.email = email.downcase }


  #names_validation
  validates :name, presence: true 
  
  #email validation
  VALID_EMAIL = /\A[\w\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
        format: {with: VALID_EMAIL}, uniqueness: { case_sensitive:false } 


  has_secure_password
   validates :password, presence: true, length: { minimum: 6 }
end
