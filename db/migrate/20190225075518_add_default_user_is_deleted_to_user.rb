class AddDefaultUserIsDeletedToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_is_deleted, :integer, :default => 0
  end
end
