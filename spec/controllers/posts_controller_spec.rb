require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#create' do
    let(:params) do
      {
        title: 'Title',
        body: 'Test post body',
        login: 'Admin'
      }
    end

    context 'success' do
      let(:json_attributes) { %w[title body author_ip login created_at updated_at] }
      before do
        post :create, params: params
      end

      it 'responds with 200 status' do
        expect(response.status).to eq 200
      end

      it 'responds with post attributes in json format' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json[:post].keys).to match(json_attributes)
      end
    end


    context 'fail' do
      let(:invalid_params) do
        {
          body: 'Test post body',
          login: 'Admin'
        }
      end
      let(:result) do
        {
          errors: ["Title can't be blank"]
        }
      end

      before { post :create, params: invalid_params }

      it 'responds with 422 status' do
        expect(response.status).to eq 422
      end

      it 'responds with errors' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json).to match(result)
      end
    end
  end
end
