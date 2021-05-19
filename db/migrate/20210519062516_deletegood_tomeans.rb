class DeletegoodTomeans < ActiveRecord::Migration[6.1]
  def change
    remove_column :means, :good
  end
end
