PageTurns::Application.routes.draw do
  match '/welcome' => 'users#welcome'
  match '/login'   => 'home#login', via: :post, defaults: { format: 'json' }
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
end