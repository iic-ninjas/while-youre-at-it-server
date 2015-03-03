class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :shopper_id, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
