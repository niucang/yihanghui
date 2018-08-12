require 'rails_admin/main_controller'

class RailsAdmin::SendCouponsController < RailsAdmin::ApplicationController
  layout false
  wechat_api

  def show
    coupon_types_ids = params[:coupon_types][:ids].select &:present?
    coupon_types = CouponType.where(id: coupon_types_ids)
    @gift_group = @current_admin_user.create_admin_gift(coupon_types)
    send_text = "恭喜获得优惠券，#{view_context.link_to '点我领取', Rails.application.routes.url_helpers.gift_share_url(@gift_group.id, host: 'http://niucang.s1.natapp.cc')}吧"
    User.all.find_each do |u|
      Wechat.api.custom_message_send({touser: u.openid, msgtype: 'text', text: {content: send_text}})
    end
    flash[:notice] = "发送成功"
    redirect_to :back
  end
end
