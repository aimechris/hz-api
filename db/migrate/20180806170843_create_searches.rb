class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :url_search
      t.references :user
      t.timestamps
    end
  end
end
