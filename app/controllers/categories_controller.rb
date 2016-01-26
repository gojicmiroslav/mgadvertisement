class CategoriesController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  def options
  	category = Category.find(params[:id])
  	render json: category.options, status: 200
  end

end
