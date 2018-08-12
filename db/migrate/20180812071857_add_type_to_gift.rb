class AddTypeToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :type, :string
  end
end
