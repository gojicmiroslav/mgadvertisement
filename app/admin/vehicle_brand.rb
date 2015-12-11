ActiveAdmin.register VehicleBrand do
	
	permit_params :name, categories: []
	
	form do |f|
    f.inputs do
      f.input :name, label: "Name"
      f.input :categories, as: :check_boxes, collection: Category.all
    end
    f.actions
  end

end
