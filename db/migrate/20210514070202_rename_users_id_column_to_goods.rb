class RenameUsersIdColumnToGoods < ActiveRecord::Migration[6.1]
  def change
    rename_column :goods, :users_id, :user_id
    rename_column :goods, :means_id, :mean_id
  end
end
