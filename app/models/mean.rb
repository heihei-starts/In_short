class Mean < ApplicationRecord
  belongs_to :content
  
  validates :meaning, presence: true
end
