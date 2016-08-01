class StaticPagesController < ApplicationController
  
  def home
  	@category = Category.find_by(name: "Cars")
  	@categories = Category.all
    @advertisements = @category.advertisements
                                .active
    														.paginate(page: params[:page], per_page: 9)
    														.order('created_at DESC')			
    @vehicle_brands = @category.vehicle_brands
  end

  def help
  end

  def about
  end

  def contact
  end
end
