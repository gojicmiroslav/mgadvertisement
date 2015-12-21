ActiveAdmin.register VehicleBrand do
	
	permit_params :name, category_ids: []

  #eager loading
  includes :categories
	
	form do |f|
    f.inputs do
      f.input :name, label: "Name"
      f.input :category_ids, as: :check_boxes, collection: Category.all
    end
    f.actions
  end

end
