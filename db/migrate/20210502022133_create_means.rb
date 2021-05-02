class CreateMeans < ActiveRecord::Migration[6.1]
  def change
    create_table :means do |t|
      t.text :meaning
      t.references  :content, foreign_key: true

      t.timestamps
    end
  end
end
