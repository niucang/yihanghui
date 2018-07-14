class Gift < ApplicationRecord
  has_many :coupons
  has_many :coupon_types, through: :coupons
  belongs_to :user
end
