class UserIpsController < ApplicationController
  DEFAULT_COUNT = 20

  def index
    render json: user_ips, each_serializer: ::UserIpsSerializer, status: :ok
  end

  private

  def user_ips
    Post.user_ips(params[:count] || DEFAULT_COUNT)
  end
end
