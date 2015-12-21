ActiveAdmin.register Category do

	permit_params :name, :description, vehicle_brand_ids: []

	#eager loading
	includes :vehicle_brands

	form do |f|
    f.inputs do
      f.input :name, label: "Category Name"
      f.input :vehicle_brand_ids, as: :check_boxes, collection: VehicleBrand.all
    end
    f.actions
    
  end

end
