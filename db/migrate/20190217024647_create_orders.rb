class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false, default: ""
      t.string :order_name, null: false, default: ""
      t.string :order_postal_code, null: false, default: ""
      t.string :order_address, null: false, default: ""
      t.integer :total_price, null: false, default: ""
      t.integer :dlv_status, null: false, default:0, limit: 1
      t.integer :cancell_status, null: false, default:0
      t.timestamps
    end
  end
end
