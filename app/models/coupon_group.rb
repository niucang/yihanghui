class CouponGroup < ApplicationRecord
  self.table_name = 'gifts'
  has_many :coupons, foreign_key: :gift_id
  has_many :coupon_types, through: :coupons
  belongs_to :user
end
