Rails.application.routes.draw do
  devise_for :models
  match 'ping'         => 'pages#ping',           as: :ping, via: :all

  root 'pages#index'
end
