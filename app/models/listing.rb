class Listing < ApplicationRecord
  # Association
  has_and_belongs_to_many :features
  has_many :listimages
  belongs_to :advertiser

  # Validation
  # validates_presence_of :
end
