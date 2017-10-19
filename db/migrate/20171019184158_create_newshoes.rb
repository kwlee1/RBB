class CreateNewshoes < ActiveRecord::Migration
  def change
    create_table :newshoes do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
