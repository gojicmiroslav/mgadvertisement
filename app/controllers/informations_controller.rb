class InformationsController < ApplicationController
  
  def index
  	render json: Information.all, status: 200
  end

  def items
  	information = Information.find(params[:id])

  	render json: information.items, status: 200
  end
end
