class RemovePasswordToAdvertiser < ActiveRecord::Migration[5.1]
  def change
    remove_column :advertisers, :password, :string
  end
end
