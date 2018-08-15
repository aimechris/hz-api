require 'rails_helper'

RSpec.describe Feature, type: :model do
  # Association Test
  it { should belong_to(:listing) }
  # Validation Test
  it { should validate_presence_of(:feature_name) }
end
