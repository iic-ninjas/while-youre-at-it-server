class AddNotificationKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification_key, :string
  end
end
