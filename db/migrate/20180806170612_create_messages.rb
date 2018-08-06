class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :mssg_txt
      t.references :listing
      t.datetime :created_at
      t.timestamps
    end
  end
end
