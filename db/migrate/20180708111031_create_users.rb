class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :favicon
      t.string :company
      t.string :job
      t.string :mobile_phone
      t.timestamps
    end
  end
end
