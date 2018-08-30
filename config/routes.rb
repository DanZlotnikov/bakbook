Rails.application.routes.draw do

  root 'welcome#index'
  
  get 'welcome/index'

  resources :auctions do
    resources :offers
  end

  get '/my_offers', to: 'offers#my'

  resources :users do
    resources :auctions
    resources :offers
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
