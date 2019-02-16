class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :item_id, null: false, default: ""
      t.integer :amount, null: false, default: ""
      t.timestamps
    end
  end
end
