class AddPasswordDigestToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :password_digest, :string
  end
end
