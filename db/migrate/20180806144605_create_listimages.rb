class CreateListimages < ActiveRecord::Migration[5.1]
  def change
    create_table :listimages do |t|

      t.timestamps
    end
  end
end
