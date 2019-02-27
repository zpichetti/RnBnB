Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: 'pages#home'
  resources :profiles, only: %i[show new create update edit] do
    resources :performances, only: %i[new create] do
      resources :booking, only: %i[new create]
    end
  end
  resources :booking, only: %i[update show]
  resources :performances, only: %i[show edit update] do
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
