class Category < ApplicationRecord
  # Associations
  has_many :posts
  validates_presence_of :category_name
end
