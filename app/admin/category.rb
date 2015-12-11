ActiveAdmin.register Category do

	permit_params :name, :description, vehicle_brands: []

	index do
		selectable_column
		id_column
		column :name
		column("Vehicle Brands") do |category|
			category.vehicle_brands
		end
	end

	form do |f|
    f.inputs do
      f.input :name, label: "Category Name"
      f.input :vehicle_brands, as: :check_boxes, collection: VehicleBrand.all
    end
    f.actions
  end

end
