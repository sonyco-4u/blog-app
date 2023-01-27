require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the rendered template' do
      expect(response).to render_template('index')
    end

    it 'return correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(1) }

    it 'eturn correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the rendered template' do
      expect(response).to render_template('show')
    end

    it 'return correct placeholder text' do
      expect(response.body).to include('Here is a profile of a given user')
    end
  end
end
