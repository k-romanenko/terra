module Posts
  class RatingsController < ApplicationController
    def create
      if form_object.valid?
        average_value = ::CreateRating.new(form_object.attributes).call
        render json: { rating: average_value }, status: :ok
      else
        render json: { errors: form_object.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def permitted_params
      params.permit(
        %i[
          post_id
          value
        ]
      ).to_h
    end

    def form_object
      @form_object ||= ::RatingForm.new(permitted_params)
    end
  end
end
