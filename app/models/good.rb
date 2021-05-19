class Good < ApplicationRecord
  belongs_to :user
  belongs_to :mean
  
  #一ユーザーは、同じmeanを何回もいいねできない。
  validates :mean_id, uniqueness: { scope: :user_id}  
end
