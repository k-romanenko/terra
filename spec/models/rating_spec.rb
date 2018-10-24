require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:post) }
  end
end
