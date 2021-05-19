class Mean < ApplicationRecord
  belongs_to :content
  has_many :goods
  
end
