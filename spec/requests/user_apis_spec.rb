require 'rails_helper'

RSpec.describe "UserApis" do
  describe "GET /users/typehead/" do
      it 'returns a status message' do
        get('/users/typehead/Prajwal')
        expect(response).to have_http_status(200)
      end
    end
  
      it 'returns a status message' do
        get('/users/typehead/1')
        expect(response).to have_http_status(404)
      end
    end
