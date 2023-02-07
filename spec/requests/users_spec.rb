require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) { get users_path }
    it 'the request is a success' do
      expect(response).to have_http_status(200)
    end
    it 'Renders the right template' do
      expect(response).to render_template('index')
    end
    it 'Include the correct text' do
      expect(response.body).to include('List of all users')
    end
  end
  describe 'GET /show' do
    before(:example) { get user_path(id: 1) }
    it 'the request is a success' do
      expect(response).to have_http_status(200)
    end
    it 'Renders the right template' do
      expect(response).to render_template('show')
    end
    it 'Include the correct text' do
      expect(response.body).to include('Here is data and posts for certain user')
    end
  end
end
