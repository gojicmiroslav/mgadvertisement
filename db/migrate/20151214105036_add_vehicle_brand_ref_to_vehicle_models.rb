class AddVehicleBrandRefToVehicleModels < ActiveRecord::Migration
  def change
  	add_reference :vehicle_models, :vehicle_brand, index: true
  	add_foreign_key :vehicle_models, :vehicle_brands
  end
end
