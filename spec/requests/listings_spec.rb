require 'rails_helper'

RSpec.describe 'Listings API', type: :request do
  # initialize test data
  let!(:listings) { create_list(:listing, 10) }
  let(:listing_id) { listings.first.id }
  let!(:listimages) { create_list(:listimage, 10, listing_id: listing.id) }
  let(:listimage_id) { listimages.first.id }
  let!(:feature_listing) { create(:listing_with_features, features_count: 15) }

  # Test Requests
  describe 'GET /listings' do
    # Make HTTP get request before each example
    before { get '/listings' }

    it "returns listings" do
      # Note 'Json' is a custom helper to parse JSON response
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /listings/:id' do
    before { get "/listings/#{listing_id}" }

    context 'when the record exists' do
      let(:listing_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Listing not Found/)
      end
    end
  end

  # Test suite for POST /listings
  describe 'POST /listings'do
    # valid payload
    let(:valid_attributes) {{ address: 'nyny', zip_code: '4556', city:'NY', state:'New York',
                              bed:'4', bath:'5', sqft:'200', property_type:'apartment',
                              built_year:'1998', sale_type:'rent', price:'3000',
                              title:'ttrtr', description:'rtrtr', virtual_tour:'http//d',
                              display_img:'rttt', listimages_attribute:[image:'gty']
                            }}
    context 'when the request is valid' do
      before { post '/listings', params: valid_attributes }

      it "creates a listing" do
        expect(json['title']).to eq('ttrtr')
      end

      it "creates a listing image" do
        expect(json['listimages_attribute("image")']).to eq('gty')
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/listings', params:{ title: 'qet' } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Created can't be blank/)
      end
    end
  end


  # test suite for PUT /listings/:id
  describe 'PUT /listings/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/listings/#{listing_id}", params:valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for Delete /listings/:id

  describe 'DELETE /listings/:id' do
    before { delete "/listings/#{listing_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
