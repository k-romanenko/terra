class PostForm
  include ActiveModel::Model
  include Virtus.model

  attribute :title, String
  attribute :body, String
  attribute :author_ip, String
  attribute :login, String

  validates :title, :body, :author_ip, :login, presence: true
end
