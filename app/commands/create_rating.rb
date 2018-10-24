class CreateRating
  def initialize(attributes)
    @attributes = attributes
  end

  def call
    ::Rating.transaction do
      creat_rating
      average_post_rating
    end
  end

  private

  def creat_rating
    ::Rating.create(@attributes)
  end

  def average_post_rating
    ::Rating.where(post_id: @attributes[:post_id]).average(:value)
  end
end
