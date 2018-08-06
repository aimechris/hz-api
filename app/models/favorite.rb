class Favorite < ApplicationRecord
  # Associations
  belongs_to :user
  # Validations
  #validates_presence_of
end
