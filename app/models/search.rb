class Search < ApplicationRecord
  # Associations
  belongs_to :user
  # Validations
  validates_presence_of :url_search, :created_by
end
