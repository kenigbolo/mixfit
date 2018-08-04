# Rails Routing
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  # Api endpoints
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create update] do
        resources :food_intakes, only: %i[create update]
        resources :activity_levels, only: %i[create update]
        resources :recipes, only: %i[index new show]
      end
    end
  end
end
