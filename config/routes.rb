require 'api_constraints'
Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      jsonapi_resources :regions do
      end
      jsonapi_resources :clients
      jsonapi_resources :raw_executives
    end
  end


  get 'index' => 'home#index', :as => 'index'
  root :to => 'home#index'

end
