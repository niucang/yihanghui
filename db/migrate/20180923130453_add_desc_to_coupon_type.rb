class AddDescToCouponType < ActiveRecord::Migration[5.1]
  def change
    add_column :coupon_types, :desc, :string, comment: '优惠券描述'
  end
end
