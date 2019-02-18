class CreateTunes < ActiveRecord::Migration[5.2]
  def change
    create_table :tunes do |t|
      t.string :tune_name
      t.integer :disc_id
      t.integer :index
      t.timestamps
    end
  end
end
