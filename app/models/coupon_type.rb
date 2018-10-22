class CouponType < ApplicationRecord
  has_one_attached :img
  has_many :coupons

  def initial_coupon_for_user(user)
    user.gift.coupons.new(coupon_type: self)
  end

  def share_url
    Rails.application.routes.url_helpers.specific_coupon_url(id, host: "http://zhizhihudong.com")
  end
end
