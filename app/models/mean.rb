class Mean < ApplicationRecord
  belongs_to :content
  belongs_to :user
  has_many :goods
  
end
