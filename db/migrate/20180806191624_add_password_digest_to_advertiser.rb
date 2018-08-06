class AddPasswordDigestToAdvertiser < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisers, :password_digest, :string
  end
end
