class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  skip_before_action :authentication
  wechat_api
  wechat_responder
  def index
    wechat_oauth2 do |openid|
    end
  end

  on :scan, with: 'subscribe' do |request, ticket|
    request.reply.text "Subscribe user #{request.to_json} Ticket #{ticket}"
  end
  on :scan, with: 'scene_id' do |request, content|
    Rails.logger.info request
    Rails.logger.info content
    request.reply.text "event scan got EventKey #{request.to_json}"
  end
end
