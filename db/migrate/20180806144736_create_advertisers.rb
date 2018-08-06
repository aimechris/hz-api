class CreateAdvertisers < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisers do |t|

      t.timestamps
    end
  end
end
