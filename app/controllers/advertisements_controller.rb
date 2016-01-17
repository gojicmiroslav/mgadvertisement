class AdvertisementsController < ApplicationController
  
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
    @options = @advertisement.options
  end

  def new
    @advertisement = Advertisement.new
    @categories = Category.all
    @fuels = Fuel.all
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.user = current_user

    if @advertisement.save 
      flash[:success] = "Advertisement successfully created."
      redirect_to @advertisement
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def advertisement_params
    params.require(:advertisement).permit(:title, :description, :price, :year, :capacity, :power, 
                                          :mileage, :fuel_id, :style_id, :air_condition_id, 
                                          :exterior_color_id, :interior_color_id, :engine_id, :drive_id,
                                          :transmission_id, :category_id, :vehicle_model_id, :user_id,
                                          :advertisement_type_id)
  end

end
