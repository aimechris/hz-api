require 'rails_helper'

RSpec.describe Search, type: :model do
  # Associations Test
  it { should belong_to (:user) }
  # Validations Test
  it { should validate_presence_of (:url_search) }
  it { should validate_presence_of (:created_by) }
end
