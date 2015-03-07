class MoveStatusToUsers < ActiveRecord::Migration
  def change
    remove_column :trips, :status
    add_column :users, :state, :integer, default: 0, null: false
  end
end
