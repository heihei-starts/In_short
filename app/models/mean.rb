class Mean < ApplicationRecord
  belongs_to :content
  has_many :goods
  
  validates :meaning, presence: true
end
