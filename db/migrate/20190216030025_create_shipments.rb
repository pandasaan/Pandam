class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :shipment_name , null: false, default: ""
      t.string :shipment_name_kana , null: false, default: ""
      t.string :shipment_postal_code , null: false, default: ""
      t.string :shipment_address , null: false, default: ""
      t.integer :user_id , null: false

      t.timestamps
    end
    add_index :shipments, :shipment_name
    add_index :shipments, :shipment_name_kana
    add_index :shipments, :shipment_address
  end
end
