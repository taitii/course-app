Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/courses", to: "courses#index"
  resources :courses

  get "/students", to: "students#index"
  resources :students

  resources :participants
end
