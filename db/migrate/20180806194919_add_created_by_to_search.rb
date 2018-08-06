class AddCreatedByToSearch < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :created_by, :string
  end
end
