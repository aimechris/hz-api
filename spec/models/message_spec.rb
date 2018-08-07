require 'rails_helper'

RSpec.describe Message, type: :model do
  # Association Test
  it { should belong_to (:listing) }
  # Validations Test
  it { should validate_presence_of (:mssg_txt) }
  it { should validate_presence_of (:created_at) }
end
