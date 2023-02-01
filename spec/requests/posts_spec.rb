require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:example) { get user_posts_path(user_id: 1) }
    it 'the request is a success' do
      expect(response).to have_http_status(200)
    end
    it 'Renders the right template' do
      expect(response).to render_template('index')
    end
    it 'Include the correct text' do
      expect(response.body).to include('a user posts')
    end
  end
  describe 'GET /show' do
    before(:example) { get user_post_path(user_id: 1, id: 1) }
    it 'the request is a success' do
      expect(response).to have_http_status(200)
    end
    it 'Renders the right template' do
      expect(response).to render_template('show')
    end
    it 'Include the correct text' do
      expect(response.body).to include('Here is a single post for certain user')
    end
  end
end
