class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|

      t.string :disc_name
      t.integer :item_id
      t.timestamps
    end
  end
end
