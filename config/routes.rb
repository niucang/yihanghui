Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resource :wechat, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gift_shares, only: [:show] do
    member do
      get :get_coupons
      get :open
      get :share
    end
  end

  resources :users, only: [:update] do
    collection do
      get :auth_user
      get :gift
      get :register
      post :get_msg_code
      get :subscribe_info
      get :share_info
      get :subscribe_image
    end
  end
end
RailsAdmin::Engine.routes.draw do
  resource :show_coupon, only: [:show]
  resource :send_coupon, only: [] do
    post :show, on: :collection
  end
end
