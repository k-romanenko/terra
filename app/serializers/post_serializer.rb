class PostSerializer < ActiveModel::Serializer
  attributes :title, :body, :author_ip, :login, :created_at, :updated_at

  def login
    object.user.login
  end
end
