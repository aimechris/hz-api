require 'rails_helper'

RSpec.describe 'Advertisers API', type: :request do
  let(:advertiser) { build(:advertiser) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:advertiser, password_confirmation: advertiser.password)
  end

  # Advertiser signup test suite

  describe 'POST /advertiser/signup' do
    context 'when valid request' do
      before { post '/advertiser/signup', params: valid_attributes.to_json, headers:headers }

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
      before { post '/advertiser/signup', params: {}, headers: headers }

      it "does not create a new advertiser" do
        expect(response).to have_http_status(422)
      end

      it "returns failure message" do
        expect(json['message']).to match(/Validation failed: Password can't be blank, Name can't be bank/)
      end
    end
  end
end
