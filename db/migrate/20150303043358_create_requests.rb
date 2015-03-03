class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.integer :trip_id, null: false
      t.integer :status, default: 0, null: false
      t.text :items, array: true, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
