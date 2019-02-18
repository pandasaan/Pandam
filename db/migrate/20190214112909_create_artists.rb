class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist_name, unique: true, default: ""
      t.text :comment, default: ""

      t.timestamps
    end
  end
end
