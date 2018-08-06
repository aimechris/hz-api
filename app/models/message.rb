class Message < ApplicationRecord
  # Associations
  belongs_to :listing
  # Validations
  validates_presence_of :mssg_txt
end
