class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_id, null: false
      t.string :name
      t.string :paypal_account
      t.string :phone_number
      t.string :auth_token

      t.timestamps
    end

    add_index :users, :facebook_id, unique: true
    add_index :users, :auth_token, unique: true
  end
end
