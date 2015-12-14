class AddIndexToVehicleBrandsName < ActiveRecord::Migration
  def change
  	add_index :vehicle_brands, :name, unique: true
  end
end
