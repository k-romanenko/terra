require 'rails_helper'

RSpec.describe Posts::RatingsController, type: :controller do
  describe '#create' do
    let(:user) { create(:user) }
    let(:users_post) { create(:post, user: user, login: user.login) }
    let(:value) { rand(1..5) }
    let(:params) do
      {
        post_id: users_post.id,
        value: value
      }
    end

    context 'when success' do
      before { post :create, params: params }

      it 'responds with 200 status' do
        expect(response.status).to eq 200
      end

      it 'responds with post rating average value' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json[:rating]).to eq value.to_d.to_s
      end
    end

    context 'when fail' do
      let(:invalid_params) do
        {
          post_id: users_post.id,
          value: 10
        }
      end

      before { post :create, params: invalid_params }

      it 'responds with 422 status' do
        expect(response.status).to eq 422
      end

      it 'responds with errors' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json.keys).to match_array(['errors'])
      end
    end
  end
end
