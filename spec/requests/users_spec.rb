require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  # User signup test suite

  describe 'POST /user/signup' do
    context 'when valid request' do
      before { post '/user/signup', params: valid_attributes.to_json, headers:headers }

      it "creates a new advertiser" do
        expect(response).to have_http_status(201)
      end

      it "returns a sucess message" do
        expect(json['message']).to match(/Account created successfully/)
      end

      it "returns an authentication token" do
        expect(json['auth_token']).not_to be_nill
      end
    end

    context 'when invalid request' do
      before { post '/user/signup', params: {}, headers: headers }

      it "does not create a new advertiser" do
        expect(response).to have_http_status(422)
      end

      it "returns failure message" do
        expect(json['message']).to match(/Validation failed: Password can't be blank, Name can't be bank/)
      end
    end
  end
end
