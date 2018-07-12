class AddOpenidToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :openid, :string, index: true
  end
end
