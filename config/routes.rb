Rails.application.routes.draw do
  resources :teachers, only: [:index]

  resources :students, only: [:index]
end
