require 'rails_helper'

RSpec.describe Favorite, type: :model do
  # Associations Test
  it { should belong_to (:user) }
  it { should belong_to (:listing) }
  # Validations Test
  it { should validate_presence_of (:created_by) }
end
