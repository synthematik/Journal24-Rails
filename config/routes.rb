Rails.application.routes.draw do

  root "articles#index"

  resources :articles do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users

end