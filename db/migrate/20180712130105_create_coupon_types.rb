class CreateCouponTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_types do |t|
      t.string :title, null: false

      t.timestamps
    end
    add_column :coupons, :coupon_type_id, :integer, index: true
  end
end
