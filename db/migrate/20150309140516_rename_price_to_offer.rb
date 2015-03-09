class RenamePriceToOffer < ActiveRecord::Migration
  def change
    rename_column :requests, :price, :offer
  end
end
