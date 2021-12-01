require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GETS #index' do
    before(:example) { get user_posts_path(5) }

    it 'should return 200 ok response' do
      expect(response).to have_http_status(200)
    end

    it 'should have correct view template rendered' do
      expect(response).to render_template(:index)
    end

    it 'should contain the right message' do
      expect(response.body).to include('A list of all posts by user id')
    end
  end

  describe 'GET #details' do
    before(:example) { get user_post_path(4, 5) }

    it 'should return 200 ok response' do
      expect(response).to have_http_status(200)
    end

    it 'should have correct view template rendered' do
      expect(response).to render_template(:show)
    end

    it 'should contain the right message' do
      expect(response.body).to include('Post details of a certain user')
    end
  end
end