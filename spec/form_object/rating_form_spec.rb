require 'rails_helper'

RSpec.describe RatingForm, type: :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :post_id }

  describe 'valid?' do
    subject(:form_object) { described_class.new(attributes) }

    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    let(:base_attributes) do
      {
        value: rand(1..5),
        post_id: post.id
      }
    end

    context 'valid' do
      let(:attributes) { base_attributes }

      it { is_expected.to be_valid }
    end

    context 'invalid value' do
      let(:attributes) { base_attributes.merge(value: 10) }

      it { is_expected.to be_invalid }
    end

    context 'invalid value' do
      let(:attributes) { base_attributes.merge(post_id: (post.id + 1)) }

      it { is_expected.to be_invalid }
    end
  end
end
