class TopPostsController < ApplicationController
  DEFAULT_COUNT = 10

  def index
    render json: posts, each_serializer: ::TopPostSerializer, status: :ok
  end

  private

  def posts
    Post.top_rated(params[:count] || DEFAULT_COUNT)
  end
end
