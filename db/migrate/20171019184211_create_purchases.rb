class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :newshoe, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
