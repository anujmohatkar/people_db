Rails.application.routes.draw do
  devise_for :users
  resources :addresses
  resources :people
  
  authenticated :user do
    mount Blazer::Engine, at: "blazer"
  end

  root "people#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
