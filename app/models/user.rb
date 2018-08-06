class User < ApplicationRecord
  # Encrypt password
  has_secure_password
  # Associations
  has_many :favorites, foreign_key: :created_by
  has_many :searches, foreign_key: :created_by
  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_digest
end
