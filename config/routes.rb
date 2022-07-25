Rails.application.routes.draw do
  root to: 'flight_paths#index'
  resources :flight_paths, only: [:calculate_distance] do
    collection do
      post :calculate_distance
    end
  end
end
