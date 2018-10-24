class CreatePost
  def initialize(post_params)
    @login = post_params.delete(:login)
    @post_params = post_params
  end

  def call
    post = Post.new(@post_params)
    post.user = user
    post.save
    post
  end

  private

  def user
    @user ||= User.find_or_create_by(login: @login)
  end
end
