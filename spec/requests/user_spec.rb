require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:base_endpoint) { '/shift/users' }

  describe 'GET /index' do
    before do
      sign_in user
    end

    it 'returns http success' do
      get base_endpoint
      expect(response).to have_http_status(:success)
    end
    it 'return success message' do
      get base_endpoint
      expect(response.body).to include('You Done!')
    end
  end
end
