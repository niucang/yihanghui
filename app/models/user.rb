class User < ApplicationRecord
  has_one :gift
  has_many :coupons, through: :gift
  has_secure_password
  validates :mobile_phone, presence: true

  def gift
    Gift.find_or_create_by(user_id: self.id)
  end

  # 根据分享的卡包添加优惠券
  def add_coupons_by_gift(gift)
    raise ArgumentError, "不能打开自己的红包" if gift.user == self
    ActiveRecord::Base.transaction do
      gift.coupon_types.map { |ct| ct.initial_coupon_for_user(self) }
                       .each do |coupon|
                         coupon.from_id = gift.user_id
                         coupon.save!
                       end
    end
  end
end
