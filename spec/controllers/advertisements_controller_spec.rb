require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  # test permit
  it do   
    params = {
      advertisement: {
        title: "2010 BMW X1 2.0 Navi/xDrive", 
        description: "Some description", 
        price: 14.000, 
        year: DateTime.strptime("01/01/2000", "%m/%d/%Y"),
        capacity: 1800, 
        power: 2000, 
        mileage: 200.000, 
        fuel: 1, 
        style: 1, 
        air_condition: 1, 
        exterior_color: 1,
        interior_color: 1, 
        engine: 1, 
        drive: 1, 
        transmission: 1,
        category: 1, 
        vehicle_model: 1, 
        user: 1, 
        advertisement_type: 1
      }
    }

    should  permit(:title, :description, :price, :year, :capacity, :power, 
                    :mileage, :fuel_id, :style_id, :air_condition_id, 
                    :exterior_color_id, :interior_color_id, :engine_id, :drive_id,
                    :transmission_id, :category_id, :vehicle_model_id, :user_id,
                    :advertisement_type_id
                    ).for(:create, params: params).on(:advertisement)
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      #get :show
      #expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      #get :create
      #expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      #get :edit
      #expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      #get :update
      #expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      #get :destroy
      #expect(response).to have_http_status(:success)
    end
  end

end
