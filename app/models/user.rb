class User < ApplicationRecord
 
  #コールバック関数
  #before_validation do
  #
  #end


  #names_validation
  validates :name, presence: true 


  has_secure_password
end
