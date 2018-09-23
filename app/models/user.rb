class User < ApplicationRecord
  has_one :gift
  has_many :admin_gifts
  has_many :coupons, through: :gift
  has_many :coupon_types, -> { distinct },  through: :coupons
  has_secure_password

  def gift
    Gift.find_or_create_by(user_id: self.id)
  end

  # 根据分享的卡包添加优惠券
  def add_coupons_by_gift(gift_group)
    # raise ArgumentError, "不能打开自己的红包" if gift.user == self
    ActiveRecord::Base.transaction do
      agree_types = gift_group.coupon_types - coupon_types
      agree_types.map { |ct| ct.initial_coupon_for_user(self) }
                       .each do |coupon|
                         coupon.from_id = gift_group.user_id
                         coupon.save!
                       end
    end
  end

  def create_admin_gift(coupon_types)
    raise User::AuthError.new unless self.admin?
    ActiveRecord::Base.transaction do
      coupon_group = self.admin_gifts.create!
      coupon_types.each do |ct|
        Coupon.create!(coupon_type: ct, coupon_group: coupon_group)
      end
      coupon_group
    end
  end

  class AuthError < RuntimeError
  end
end
