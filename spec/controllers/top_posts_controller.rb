require 'rails_helper'

RSpec.describe TopPostsController, type: :controller do
  describe '#index' do
    let(:user) { create(:user) }

    let(:users_post1) { create(:post, user: user) }
    let(:users_post2) { create(:post, user: user) }
    let(:users_post3) { create(:post, user: user) }
    let(:users_post4) { create(:post, user: user) }
    let(:users_post5) { create(:post, user: user) }

    let(:value1) { 5 }
    let(:value2) { 2 }
    let(:value3) { 3 }
    let(:value4) { 4 }
    let(:value5) { 1 }

    let(:params) do
      {
        count: 3
      }
    end

    before do
      stub_const('TopPostsController::DEFAULT_COUNT', 4)
      users_post1.update(rating_sum: value1, rating_count: 1)
      users_post2.update(rating_sum: value2, rating_count: 1)
      users_post3.update(rating_sum: value3, rating_count: 1)
      users_post4.update(rating_sum: value4, rating_count: 1)
      users_post5.update(rating_sum: value5, rating_count: 1)

      get :index, params: params
    end

    it 'responds with 200 status' do
      expect(response.status).to eq 200
    end

    context 'with count' do
      let(:result) do
        [
          {
            'title' => users_post1.title,
            'body' => users_post1.body
          },
          {
            'title' => users_post3.title,
            'body' => users_post3.body
          },
          {
            'title' => users_post4.title,
            'body' => users_post4.body
          }
        ]
      end

      it 'responds with top rated posts' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json[:posts]).to match_array(result)
      end
    end

    context 'without count' do
      let(:params) { {} }
      let(:result) do
        [
          {
            'title' => users_post1.title,
            'body' => users_post1.body
          },
          {
            'title' => users_post3.title,
            'body' => users_post3.body
          },
          {
            'title' => users_post4.title,
            'body' => users_post4.body
          },
          {
            'title' => users_post2.title,
            'body' => users_post2.body
          }
        ]
      end

      it 'responds with top rated posts with default limit' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json[:posts]).to match_array(result)
      end
    end
  end
end
