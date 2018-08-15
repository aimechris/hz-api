require 'rails_helper'

RSpec.describe AuthenticateAuthor do
  # create test author
  let(:author) { create(:author) }
  # valid request subject
  subject(:valid_auth_obj) { described_class.new(author.email, author.password) }
  # invalid request subject
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  # Test suite for Authenticateauthor#call

  describe '#call' do
    # return token when valid request
    context 'when valid credentials' do
      it "returns an auth token" do
        token = valid_auth_obj.call
        expect(token).not_to be_nill
      end
    end

    # raise Authentication Error when invalid request
    context 'when invalid credentials' do
      it "raises an authentication erro" do
        expect { invalid_auth_obj.call }.to raise_error(
          ExceptionHandler::AuthenticationError,/Invalid credetials/
        )
      end
    end
  end
end
