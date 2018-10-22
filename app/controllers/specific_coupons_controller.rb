class SpecificCouponsController < ApplicationController
  before_action :set_coupon
  def show
  end

  def open
    @images = CouponOpenImage.all.where(is_active: true)
  end

  def get_coupon
    current_user.add_coupon!(@coupon_type)
    redirect_to gift_users_path
  end

  def subscribe_image
    qrcode_image = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=#{Wechat.api.qrcode_create_scene({spec: params[:id]}.to_json, 2592000)['ticket']}"
    render json: {image: qrcode_image}
  end
  private
    def set_coupon
      @coupon_type ||= CouponType.find(params[:id])
    end
end
