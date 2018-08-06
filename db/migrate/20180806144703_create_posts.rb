class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.references :category      
      t.string :subtitle
      t.text :content
      t.references :tag
      t.string :post_image, null: false
      t.string :status, default: "draft", null: false
      t.string :published_by
      t.datetime :published_at

      t.timestamps
    end
  end
end
