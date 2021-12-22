Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get 'search' => 'posts#search'


  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get 'posts/new_add'

  resources :users

end
