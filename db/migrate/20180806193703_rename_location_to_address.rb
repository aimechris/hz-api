class RenameLocationToAddress < ActiveRecord::Migration[5.1]
  def change
    rename_column :advertisers, :location, :address
  end
end
