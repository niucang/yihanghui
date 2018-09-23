class CreateCouponOpenImages < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_open_images do |t|
      t.string :img_url
      t.boolean :is_active, default: true

      t.timestamps
    end
  end

  add_column :advertisings, :is_active, :boolean, default: true
end
