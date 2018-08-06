class Feature < ApplicationRecord
  # Association 
  has_and_belongs_to_many :listings
end
