class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  def rating_average
    rating_sum.to_d / rating_count
  end
end
