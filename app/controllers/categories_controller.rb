class CategoriesController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_advertisements = @category.advertisements
  end

  def basic
  	basic_id = InformationType.find_by(name: "Basic").id
  	category = Category.find(params[:id])
  	basic_informations = []

  	category.information.each do |info|
  		if info.information_type_id == basic_id
  			basic_informations << info
  		end
  	end

  	render json: basic_informations, status: 200
  end

  def additional
  	additional_id = InformationType.find_by(name: "Additional").id
  	category = Category.find(params[:id])
  	additional_informations = []

  	category.information.each do |info|
  		if info.information_type_id == additional_id
  			additional_informations << info
  		end
  	end

  	render json: additional_informations, status: 200
  end

  def options
  	category = Category.find(params[:id])
  	render json: category.options, status: 200
  end

end
