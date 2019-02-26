Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profiles, only: %i[show, new, create, update] do 
    resources :performances, only: %i[show, new, create, edit, :update] do 
    end
    resources :performance_dates, only: %i[new, create, update, destroy] do
    end 
  end 
  resources :booking, only: %i[new, create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
