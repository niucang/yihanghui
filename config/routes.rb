Rails.application.routes.draw do
  get 'gift_shares/show'

  resource :wechat, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
