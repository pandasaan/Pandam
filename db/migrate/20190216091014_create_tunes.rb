class CreateTunes < ActiveRecord::Migration[5.2]
  def change
    create_table :tunes do |t|
      t.string :tune_name, null: false, default: ""
      t.integer :disc_id, null: false, default: ""
      t.integer :index, null: false, default: ""
      t.timestamps
    end
  end
end
