class Listimage < ApplicationRecord
  # Associations
  belongs_to :listing, inverse_of: :listimages
  # Validations
  validates_presence_of :image
end
