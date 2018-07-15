Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resource :wechat, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gift_shares, only: [:show] do
    member do
      post :get_coupons
    end
  end

  resources :users, only: [] do
    collection do
      get :auth_user
      get :gift
    end
  end
end
