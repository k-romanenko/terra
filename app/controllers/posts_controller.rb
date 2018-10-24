class PostsController < ApplicationController
  def create
    if form_object.valid?
      post = ::PostCreator.new(form_object.attributes).call
      render json: post, status: :ok
    else
      render json: { errors: form_object.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.permit(
      %i[
        title
        body
        login
      ]
    ).to_h.merge(author_ip: request.remote_ip)
  end

  def form_object
    @form_object ||= ::PostForm.new(permitted_params)
  end
end
