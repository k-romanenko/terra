require 'rails_helper'

RSpec.describe CreateRating do
  describe '#call' do
    subject(:creator) { described_class.new(attributes) }

    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    let(:value1) { rand(1..5) }
    let(:value2) { rand(1..5) }
    let(:value3) { rand(1..5) }
    let(:value4) { rand(1..5) }

    let(:average) { (value1 + value2 + value3 + value4).to_d / 4 }

    let(:attributes) do
      {
        value: value4,
        post_id: post.id
      }
    end

    it { expect { creator.call }.to change(Rating, :count).by(1) }

    context 'with other ratings' do
      before do
        create(:rating, value: value1, post: post)
        create(:rating, value: value2, post: post)
        create(:rating, value: value3, post: post)
      end

      it { expect(creator.call).to eq average }
    end
  end
end
