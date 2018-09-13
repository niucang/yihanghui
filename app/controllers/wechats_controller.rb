class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  skip_before_action :authentication
  wechat_api
  wechat_responder
  def index
    wechat_oauth2 do |openid|
    end
  end

  on :event, with: 'subscribe' do |request, ticket|
    Rails.logger.info 'subscribe'
    Rails.logger.info request
    Rails.logger.info request[:EventKey]
    request.reply.text "#{request[:EventKey]}"
  end
  on :event, with: 'scan' do |request, content|
    Rails.logger.info 'scan'
    Rails.logger.info request
    request.reply.text "event scan got EventKey #{request.to_json}"
  end
end
