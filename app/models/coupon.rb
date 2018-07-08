class Coupon < ApplicationRecord
  belongs_to :gift
  has_one :user, through: :gift
  belongs_to :from_user, foreign_key: 'from_id', class_name: :user
end
