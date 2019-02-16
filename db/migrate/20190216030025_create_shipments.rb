class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :shipment_name
      t.string :shipment_name_kana
      t.string :shipment_postal_code
      t.string :shipment_address
      t.integer :user_id

      t.timestamps
    end
    add_index :shipments, :shipment_name
    add_index :shipments, :shipment_name_kana
    add_index :shipments, :shipment_address
  end
end
