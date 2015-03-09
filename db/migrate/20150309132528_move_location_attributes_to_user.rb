class MoveLocationAttributesToUser < ActiveRecord::Migration
  def change
    drop_table :locations

    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :latitude, :decimal, precision: 10, scale: 6
    add_column :users, :longitude, :decimal, precision: 10, scale: 6
  end
end
