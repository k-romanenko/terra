require 'rails_helper'

RSpec.describe RatingForm, type: :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :post_id }

  describe 'valid?' do
    subject(:form_objects) { described_class.new(attributes) }

    let(:user) { create(:user) }
    let(:post) { create(:post, user: user, login: user.login) }

    let(:base_attributes) do
      {
        value: rand(1..5),
        post_id: post.id
      }
    end

    context 'with valid attributes' do
      let(:attributes) { base_attributes }

      it { is_expected.to be_valid }
    end

    context 'with invalid value' do
      let(:attributes) { base_attributes.merge(value: 10) }

      it { is_expected.to be_invalid }
    end

    context 'without post' do
      let(:attributes) { base_attributes.merge(post_id: (post.id + 1)) }

      it { is_expected.to be_invalid }
    end
  end
end
