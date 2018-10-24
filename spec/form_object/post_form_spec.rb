require 'rails_helper'

RSpec.describe PostForm, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_presence_of :author_ip }
  it { is_expected.to validate_presence_of :login }

  describe 'valid?' do
    subject(:form_object) { described_class.new(attributes) }

    let(:base_attributes) do
      {
        title: 'Title',
        body: 'Test post body',
        login: 'Admin',
        author_ip: '127.0.0.1'
      }
    end

    context 'valid' do
      let(:attributes) { base_attributes }

      it { is_expected.to be_valid }
    end

    context 'invalid login' do
      let(:attributes) { base_attributes.merge(login: '') }

      it { is_expected.to be_invalid }
    end
  end
end
