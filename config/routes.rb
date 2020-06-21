Rails.application.routes.draw do
  namespace :v1 do
    resources :tickets
    resources :sessions, only: [:create, :destroy]
  end
end
