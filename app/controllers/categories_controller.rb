class CategoriesController < ApplicationController
  
  

  def index
    @category = Category.find_by(name: "Cars")
  	@categories = Category.all
    @advertisements = Advertisement.where("category_id = ?", @category)
    @vehicle_brands = @category.vehicle_brands
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @category_advertisements = @category.advertisements
    @vehicle_brands = @category.vehicle_brands
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
