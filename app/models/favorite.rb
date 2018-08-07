class Favorite < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :listing
  # Validations
  validates_presence_of :created_by
end
