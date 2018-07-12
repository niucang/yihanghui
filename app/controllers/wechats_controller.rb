class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_api
  wechat_responder
  def index
    wechat_oauth2('snsapi_base') do |openid|
    end
  end
end
