class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.belongs_to :user
      t.datetime :shared_at
      t.timestamps
    end
  end
end
