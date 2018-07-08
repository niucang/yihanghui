class RenameUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :coupons, :user_id, :from_id
  end
end
