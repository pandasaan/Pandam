class AddDefaultToCarts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :carts, :amount, 0
  end
end
