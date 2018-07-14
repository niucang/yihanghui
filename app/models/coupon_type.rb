class CouponType < ApplicationRecord
  has_many :coupons

  def initial_coupon_for_user(user)
    user.gift.coupons.new(user_type: self)
  end
end
