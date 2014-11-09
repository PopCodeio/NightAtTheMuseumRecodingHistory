Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }
  authenticate :user do
    namespace :users do
    end
  end
  resources :photo_tags
  match '/items/my_json'  => 'items#my_json', as: :items_json, via: :all
  resources :items
  match 'ping' => 'pages#ping', as: :ping, via: :all
  root 'pages#index'
end
