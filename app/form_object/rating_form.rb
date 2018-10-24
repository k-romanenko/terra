class RatingForm
  include ActiveModel::Model
  include Virtus.model

  attribute :value, Integer
  attribute :post_id, Integer

  validates :value, :post_id, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :post_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :validate_post_presence


  private

  def validate_post_presence
    post = Post.find_by(id: post_id)
    return true if post
    errors.add(:base, :post_blank)
    false
  end
end
