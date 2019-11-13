Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :ingredients
      resources :steps
      resources :equipments
      resources :comments
    end
  end
end
