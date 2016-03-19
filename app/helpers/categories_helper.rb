module CategoriesHelper

	def get_disabled_state(category)
		if current_page?(root_path)
			category.name.eql?("Cars")
		else
			current_page?(category)
		end
	end
end
