class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :category
      t.integer :size
      t.string :brand
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
