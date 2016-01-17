class OptionsController < ApplicationController

	def index
		id = params[:id]

		if id
			category = Category.find(id)
			options = category.options
		else 
			options = Option.all
		end 

		render json: options, status: 200	
	end
end
