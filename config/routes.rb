Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users

  root to: 'homes#top'

end
