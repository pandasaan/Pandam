class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :label

      t.timestamps
    end
    add_index :labels, :label
  end
end
