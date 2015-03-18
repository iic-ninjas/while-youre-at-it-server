class AddNotificationKeyNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification_key_name, :string
  end
end
