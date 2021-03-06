Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: 'pages#home'
  resources :profiles, only: %i[show new create update edit] do
    resources :performances, only: %i[new create] do
      resources :bookings, only: %i[new create]
    end
  end
  resources :bookings, only: %i[update show]
  resources :performances, only: %i[show edit update] do
    resources :reviews, only: :create
  end

  patch "/performances/toggle/:id", to: "performances#toggle", as: "performance_toggle"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
