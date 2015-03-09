class RemovePaypalFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :paypal_account
  end
end
