class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
    	t.string 	:title, null: false, default: ""
    	t.text 		:description
    	t.decimal :price, null: false, precision: 7, scale: 3
    	t.date 		:year, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
