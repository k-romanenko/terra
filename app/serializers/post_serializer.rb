class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author_ip, :login, :created_at, :updated_at
end
