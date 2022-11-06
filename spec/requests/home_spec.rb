require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/home'
      expect(response).to have_http_status(:success)
    end
    it 'return success message' do
      get '/home'
      expect(response.body).to include('WELCOME!')
    end
  end
end
