class AddgooTomeans < ActiveRecord::Migration[6.1]
  def change
    add_column :means, :good,:integer
  end
end
