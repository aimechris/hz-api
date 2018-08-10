require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /advertiser/auth/login' do
    # create test advertiser
    let!(:advertiser) { create(:advertiser) }
    # set headers for Authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid invalid_credentials
    let(:invalid_credentials) do
      {
        email: advertiser.email,
        password: advertiser.password
      }.to_json
    end
    let(:invalid_credentials)do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end


    # set request.headers to our custom valid_headers
    # before { allow(request).to receive(:headers).and_return(headers) }

    # returns auth token when request is valid
    context 'when request is valid' do
      before { post '/advertiser/auth/login', params: valid_credentials, headers: headers }

      it "returns an authentication token" do
        expect(json['auth_token']).not_to be_nil
      end
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      before { post 'advertiser/auth/login', params: invalid_credentials, headers: headers }

      it "returns a failure message" do
        except(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
