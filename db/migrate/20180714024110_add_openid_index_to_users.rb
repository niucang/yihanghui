class AddOpenidIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :openid
    add_column :users, :country, :string
  end
end
