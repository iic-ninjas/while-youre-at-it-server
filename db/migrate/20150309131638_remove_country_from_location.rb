class RemoveCountryFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :country
  end
end
