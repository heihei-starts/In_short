class Addindextogoods < ActiveRecord::Migration[6.1]
  def change
    add_index :goods,[:user_id,:mean_id]
  end
end
