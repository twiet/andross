Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api/tournament/index'
  resources :users, only:[:create, :index, :update, :new]
  resource :session, only:[:new, :create, :destroy]
  resources :tournaments, only: [:create, :destroy, :show, :index, :update]
  resources :matches, only:[:create, :show, :update, :index]
end
