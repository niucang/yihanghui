class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sex, :string
    add_column :users, :language, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :headimgurl, :string
  end
end
