Rails.application.routes.draw do
  root to: 'favourites#index'

  resources :favourites do
    collection do
      get :list
      get :reload_table
      get :random
    end

    member do
      get :play
      post :increment_likes
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
