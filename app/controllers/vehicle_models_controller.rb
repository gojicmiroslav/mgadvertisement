class VehicleModelsController < ApplicationController

	def index
		vehicle_models = VehicleModel
											.where(vehicle_brand_id: params[:id])
											.where(category_id: 		 params[:category_id])

		render json: vehicle_models, status: 200	
	end

end
