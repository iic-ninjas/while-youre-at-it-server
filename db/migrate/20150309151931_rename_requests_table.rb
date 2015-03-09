class RenameRequestsTable < ActiveRecord::Migration
  def change
    rename_table :requests, :shop_requests
  end
end
