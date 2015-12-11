class CreateJoinTableCategoryVehicleBrand < ActiveRecord::Migration
  def change
  	create_table :categories_vehicle_brands, id: false do |t|
  		t.references :category, null: false, index: true
  		t.references :vehicle_brand, null: false, index: true
  	end

  	add_foreign_key :categories_vehicle_brands, :categories
    add_foreign_key :categories_vehicle_brands, :vehicle_brands
  end
end
