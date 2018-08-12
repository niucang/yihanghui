class Coupon < ApplicationRecord
  belongs_to :coupon_group, foreign_key: :gift_id
  belongs_to :coupon_type
  belongs_to :from_user, foreign_key: 'from_id', class_name: "User", optional: true
end
