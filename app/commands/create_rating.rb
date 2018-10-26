class CreateRating
  def initialize(attributes)
    @attributes = attributes
  end

  def call
    rating
    average_post_rating
  end

  private

  def rating
    @rating ||= ::Rating.create(@attributes)
  end

  def average_post_rating
    post = update_post
    post.rating_avg
  rescue ActiveRecord::StaleObjectError
    retry
  end

  def update_post
    ::Post.transaction do
      post = ::Post.find(@attributes[:post_id])
      post.rating_sum += rating.value
      post.increment(:rating_count)
      post.rating_avg = post.rating_sum.to_d / post.rating_count
      post.save
      post
    end
  end
end
