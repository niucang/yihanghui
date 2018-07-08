class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.belongs_to :gift
      t.belongs_to :user, foreign_key: :from_id
      t.timestamps
    end
  end
end
