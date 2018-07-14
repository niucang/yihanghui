class User < ApplicationRecord
  has_one :gift
  has_many :coupons, through: :gift
  has_secure_password

  def gift
    Gift.find_or_create_by(user_id: self.id)
  end

  # 根据分享的卡包添加优惠券
  def add_coupons_by_gift(gift)
    ActiveRecord::Base.transaction do
      gift.coupon_types.map { |ct| ct.initial_coupon_for_user(self) }
                       .each { |coupon| coupon.save!(from_user: gift.user) }
    end
  end
end
