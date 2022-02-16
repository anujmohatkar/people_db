Rails.application.routes.draw do
  resources :addresses
  resources :people

  root "people#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end