Rails.application.routes.draw do
  root to: 'flight_paths#index'
  post 'flight_paths/calculate_flight'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
