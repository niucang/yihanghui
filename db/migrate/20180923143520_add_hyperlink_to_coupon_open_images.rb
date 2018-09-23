class AddHyperlinkToCouponOpenImages < ActiveRecord::Migration[5.1]
  def change
    add_column :coupon_open_images, :hyperlink, :string
  end
end
