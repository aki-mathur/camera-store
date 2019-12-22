require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let!(:users) { create_list(:user, 2) }
  let(:user) { users.first }
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      expect(response.body).to match_response_schema('user')
    end
  end

  context 'when user already exists' do
    before do
      # Fabricate :user, email: params[:user][:email]
      # User.new(email: params[:user][:email]).save!
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end