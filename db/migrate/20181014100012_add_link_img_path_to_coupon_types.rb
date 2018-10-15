class AddLinkImgPathToCouponTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :coupon_types, :link, :string
  end
end
