Rails.application.routes.draw do
  resources :favourites do
    collection do
      get :list
      get :reload_table
    end

    member do
      get :play
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
