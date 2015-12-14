class AddCategoryRefToVehicleModel < ActiveRecord::Migration
  def change
  	add_reference :vehicle_models, :category, index: true
  	add_foreign_key :vehicle_models, :categories
  end
end
