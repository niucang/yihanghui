class Coupon < ApplicationRecord
  belongs_to :gift
  belongs_to :coupon_type
  belongs_to :from_user, foreign_key: 'from_id', class_name: "User", optional: true
end
