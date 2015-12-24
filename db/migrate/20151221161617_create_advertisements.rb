class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
    	t.string 	:title, null: false, default: ""
    	t.text 		:description
    	t.decimal :price, null: false, precision: 7, scale: 3
    	t.date 		:year, null: false
    	t.integer :capacity, null: false
    	t.integer :power, null: false
    	t.decimal :mileage, precision: 9, scale: 3

      t.timestamps null: false
    end
  end
end
