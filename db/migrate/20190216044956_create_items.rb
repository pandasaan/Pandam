class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false, default: ""
      t.integer :artist_id, null: false, default: ""
      t.string :image_id
      t.integer :genre_id, null: false, default: ""
      t.integer :label_id, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.integer :stock, null: false, default: ""
      t.integer :item_is_deleted, null: false, default: 0

      t.timestamps
    end
    add_index :items, :title
  end
end
