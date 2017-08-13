Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api/tournament/index'
  resources :users, only:[:index, :show, :create, :update, :destroy]
  resource :session, only:[:new, :create, :destroy]
  resources :tournaments, only: [:index, :show, :create, :update, :destroy]
  resources :matches, only:[:create, :show, :update]
end
