class AddCreatedByToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :created_by, :string
  end
end
