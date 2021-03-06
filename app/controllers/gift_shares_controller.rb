class GiftSharesController < ApplicationController
  before_action :set_gift_share
  def show
  end

  def open
    @images = CouponOpenImage.all.where(is_active: true)
  end

  def share
    current_user.add_one_coupon
    @share_gift.update!(shared_at: Time.now)
    render json: {message: 'ok'}
  end

  def get_coupons
    # return render js: "window.location.href='#{register_users_path(gift: @share_gift.id)}'" if current_user.mobile_phone.blank?
    # 限制用户领取的优惠券类型
    current_user.add_coupons_by_gift(@share_gift)
    redirect_to gift_users_path
  end

  private
    def set_gift_share
      @share_gift ||= CouponGroup.find(params[:id])
    end
end
