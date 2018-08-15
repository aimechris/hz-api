class Tag < ApplicationRecord
  # Association
  belongs_to :post
  # Validations
  validates_presence_of :tag_name

end
