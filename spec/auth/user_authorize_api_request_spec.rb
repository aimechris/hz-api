require 'rails_helper'


RSpec.describe UserAuthorizeApiRequest do
  # Create test user
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => user_token_generator(user.id) } }

  subject(:invalid_request_obj) { described_class.new({}) }
  # Valid request subject
  subject(:request_obj) { described_class.new(header) }

  # Test Suite for AuthorizeApiRequest
  describe '#call' do
    # return user object when request is valid
    context 'when valid request' do
      it "returns user object" do
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    # returns error message when invalid request
    context 'when invalid request' do
      context 'when missing token' do
        it "raises a MissingToken error" do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::MissingToken, 'Missing Token')
        end
      end
      context 'when invalid token' do
        subject(:invalid_request_obj) do
          # custom helper method 'user_token_generator'
          described_class.new('Authorization' => user_token_generator(5))
        end
        it "raises an InvalidToken error" do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, /Invalid Token/)
        end
      end

      context 'when token is expired' do
        let(:header) { { 'Authorization' => expired_user_token_generator(user.id) } }
        subject(:request_obj) { described_class.new(header) }

        it "raises ExceptionHandler::ExpiredSignature error" do
          expect (request_obj.call).to raise_error(ExceptionHandler::InvalidToken,/Signature has expired/)
        end
      end

      context 'fake token' do
        let(:header) { { 'Authorization' => 'foobar' } }
        subject(:invalid_request_obj) { described_class.new(header) }

        it "handles JWT::DecodeError" do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken,/Not enough or too many segments/)
        end
      end
    end
  end
end
