Rails.application.routes.draw do
  resources :posts, only: :create do
    scope module: :posts do
      resources :ratings, only: :create
    end
  end

  resources :top_posts, only: :index
  resources :user_ips, only: :index
end
