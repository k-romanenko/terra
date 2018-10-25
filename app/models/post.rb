class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  scope :top_rated, ->(count) do
    select('title, body, (rating_sum / rating_count) as rating_average').order('rating_average desc').limit(count.to_i)
  end

  def rating_average
    rating_sum.to_d / rating_count
  end
end
