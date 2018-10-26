class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  scope :top_rated, ->(count) do
    select('id, title, body, rating_avg')
      .order('rating_avg desc')
      .limit(count.to_i)
  end

  scope :user_ips, ->(count) do
    select('posts.author_ip, array_agg(distinct(posts.login)) as logins')
      .limit(count.to_i)
      .group(:author_ip)
      .having('COUNT(posts.login) > 1')
  end
end
