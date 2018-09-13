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
    reply_text(request)
  end
  on :event, with: 'scan' do |request, content|
    reply_text(request)
  end

  private
    def reply_text request
      id = request[:EventKey].match(/[0-9]+/)[0]
      request.reply.text "谢谢关注！，<a src=\"https://zhizhihudong.com/gift_shares/1/get_coupons\">点我领取！</a>"
    end
end
