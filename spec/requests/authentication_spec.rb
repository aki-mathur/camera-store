
require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  let!(:users) { create_list(:user, 1) }
  let(:user) { users.first }
  let(:url) { '/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      # decoded_token = decoded_jwt_token_from_response(response)
      token_from_request = response.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token_from_request, 'c278782596486106ced5155afef1ec5e95c158903a59ecd49fa7564d9347a8e70bfed80999f58d6aa71b3e92e034d906a4842ce25c61acb76fe834ccb5ec0562', true)
      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post url }
    
    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  let(:url) { '/logout' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end