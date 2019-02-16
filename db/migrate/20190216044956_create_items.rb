class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :artist_id
      t.string :image_id
      t.integer :genre_id
      t.integer :label_id
      t.integer :price
      t.integer :stock
      t.integer :item_is_deleted

      t.timestamps
    end
    add_index :items, :title
  end
end
