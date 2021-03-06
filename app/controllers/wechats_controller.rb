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

  on :click, with: 'contack_us' do |request, content|
    request.reply.text '请加客服微信：Ciicho2012(请说明添加原因）'
  end

  private
    def reply_text request
      dump_json = JSON.parse request[:EventKey]
      Rails.logger.info("WECHAT/CALLBACK: EVENT: #{dump_json}")
      if dump_json.is_a? Hash
        url = get_coupon_specific_coupon_url(dump_json["spec"])
      else
        url = get_coupons_gift_share_url(dump_json)
      end
      request.reply.text "谢谢关注！<a href=\"#{url}\">点我领取！</a>\n只之温馨提醒：每分享一次创业大礼包，系统将自动给您推送一张新的优惠券！"
    end
end
