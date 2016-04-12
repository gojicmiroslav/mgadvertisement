class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show

  load_and_authorize_resource only: [:edit, :update, :destroy]

  def index
    @advertisements = Advertisement.where('user_id = ?', current_user.id)
  end

  def show
    @basic_advertisement_informations = {}
    @additional_advertisement_informations = {}
    basic_information_id = InformationType.find_by(name: "Basic").id
    additional_information_id = InformationType.find_by(name: "Additional").id

    @advertisement.informations.each do |info|
      if info.information_type.id == basic_information_id
        @basic_advertisement_informations[info.name] = ""
      elsif info.information_type.id == additional_information_id
        @additional_advertisement_informations[info.name] = ""
      end
    end

    @advertisement.advertisement_informations.each do |adv_info|
      if @basic_advertisement_informations.has_key?(adv_info.information.name)
        @basic_advertisement_informations[adv_info.information.name] = adv_info.value
      elsif @additional_advertisement_informations.has_key?(adv_info.information.name)
        @additional_advertisement_informations[adv_info.information.name] = adv_info.value
      end
    end

    @options = @advertisement.options
  end

  def new
    @advertisement = Advertisement.new
    @categories = Category.all
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.user = current_user
    @advertisement.option_ids = params[:advertisement][:options_attributes]
    #advertisement_informations = params[:advertisement][:advertisement_informations]
    advertisement_informations = get_advertisement_informations params[:advertisement][:advertisement_informations]

    if @advertisement.save_all(advertisement_informations)
      UserMailer.advertisement_created(current_user.email, @advertisement.id).deliver_now
      flash[:success] = "Advertisement successfully created."
      redirect_to @advertisement
    else
      render :new
    end
  end

  def edit
    @basic_informations = Category.get_all_category_informations(@advertisement.category.id, "Basic")
    @additional_informations = Category.get_all_category_informations(@advertisement.category.id, "Additional")
    @all_options = @advertisement.category.options
  end

  def update
    informations = get_advertisement_informations params[:advertisement][:advertisement_informations]
    @advertisement.option_ids = Advertisement.get_options params[:advertisement][:options_attributes]

    if @advertisement.update_all(advertisement_params, informations)
      flash[:success] = "Advertisement successfully updated."
      redirect_to @advertisement
    else
      @basic_informations = Category.get_all_category_informations(@advertisement.category.id, "Basic")
      @additional_informations = Category.get_all_category_informations(@advertisement.category.id, "Additional")
      @all_options = @advertisement.category.options#

      flash.now[:notice] = "ERROR: Updating advertisement.Please try again.Thank you!"
      render :edit
    end
  end

  def destroy
    @advertisement.destroy

    redirect_to advertisements_path
  end

  private

  def set_advertisement
    #@advertisement = Advertisement.find(params[:id])
    @advertisement = Advertisement.friendly.find(params[:id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:title, :description, :price, :year, :category_id,
                                          :vehicle_model_id, :user_id, :advertisement_type_id,
                                          :option_ids, :advertisement_informations, images: [])
  end

  # we have to check is Item with given id exists or is it a value
  def get_advertisement_informations(in_params)
    in_params ||= []
    ret_arr = {}
    in_params.each do |key, value|
      value = (Item.exists?(value) ? value = Item.find(value).name : value)
      ret_arr[key] = value
    end

    return ret_arr
  end

end
