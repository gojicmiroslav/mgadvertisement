class VehicleBrandsController < ApplicationController

	def index
		id = params[:id]

		if id
			category = Category.find(id)
			vehicle_brands = category.vehicle_brands
		else 
			vehicle_brands = VehicleBrand.all
		end 

		render json: vehicle_brands, status: 200	
	end

end
