class Post < ApplicationRecord
  # Associations
  belongs_to :category
  has_many :tags, inverse_of: :post
  accepts_nested_attributes_for :tags
  # Validations
  validates_presence_of :title, :content, :post_image
end
