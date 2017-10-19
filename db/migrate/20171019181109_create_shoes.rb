class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :seller
      t.integer :buyer
      t.integer :amount

      t.timestamps null: false
    end
  end
end
