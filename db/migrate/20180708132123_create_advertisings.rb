class CreateAdvertisings < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisings do |t|
      t.string :hyperlink
      t.string :img_url
      t.string :img_desc

      t.timestamps
    end
  end
end
