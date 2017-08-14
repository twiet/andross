Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index, :create, :show, :update, :destroy]
    resource :session, only: [:new, :create, :destroy]
    resources :tournaments, only: [:index, :create, :show, :update, :destroy]
    resources :matches, only: [:show]
    resources :participations, only: [:new, :create, :destroy]
    resources :tournament_generations, only: [:update]
  end

end
