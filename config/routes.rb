PageTurns::Application.routes.draw do
  match '/welcome' => 'users#welcome'
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    member do
      get 'settings'
    end
  end
end