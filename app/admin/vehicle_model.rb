ActiveAdmin.register VehicleModel do

	permit_params :name, :category_id, :vehicle_brand_id

	belongs_to :category, optional:true
	belongs_to :vehicle_brand, optional:true

	# eager loading
	includes :category, :vehicle_brand

end
