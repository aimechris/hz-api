class AddCreatedByToFavorite < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :created_by, :string
  end
end
