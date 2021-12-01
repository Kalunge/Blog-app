require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'should return 200 ok response' do
      expect(response).to have_http_status(200)
    end

    it 'should have correct view template rendered' do
      expect(response).to render_template('index')
    end

    it 'should contain the right message' do
      expect(response.body).to include('A list of users and their posts')
    end
  end

  describe 'GET #details' do
    before(:example) { get user_path(1) }

    it 'should return 200 ok response' do
      expect(response).to have_http_status(200)
    end

    it 'should have correct view template rendered' do
      expect(response).to render_template(:show)
    end

    it 'should contain the right message' do
      expect(response.body).to include('Get a user by Id')
    end
  end
end