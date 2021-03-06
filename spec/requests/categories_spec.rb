require 'rails_helper'

RSpec.describe "Categories", type: :request do
   # initialize test data 
   let!(:categories) { create_list(:category, 10) }
   let(:category_id) { categories.first.id }
 
   # Test suite for GET /categories
   describe 'GET /categories' do
     # make HTTP get request before each example
     before { get '/categories' }
 
     it 'returns categories' do
       # Note `json` is a custom helper to parse JSON responses
       expect(json).not_to be_empty
       expect(json.size).to eq(10)
     end
 
     it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
   end
 
end
