class User < ApplicationRecord
  has_one :gift
  has_many :coupons, through: :gift
end
