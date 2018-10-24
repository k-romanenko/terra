require 'rails_helper'

RSpec.describe CreatePost do
  describe '#call' do
    subject(:creator) { described_class.new(attributes) }

    let(:attributes) do
      {
        title: 'Title',
        body: 'Test post body',
        author_ip: '127.0.0.1',
        login: 'Admin'
      }
    end

    context 'without existed user' do
      it { expect { creator.call }.to change(Post, :count).by(1) }
      it { expect { creator.call }.to change(User, :count).by(1) }
    end

    context 'with existed user' do
      before { create(:user, login: 'Admin') }

      it { expect { creator.call }.to change(Post, :count).by(1) }
      it { expect { creator.call }.not_to change(User, :count) }
    end

    it { expect(creator.call).to eq Post.last }
  end
end
