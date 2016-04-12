require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  fixtures :advertisement_types
  fixtures :users
  fixtures :information_types
  fixtures :information
  fixtures :items
  fixtures :categories
  fixtures :vehicle_brands
  fixtures :vehicle_models
  fixtures :options
  fixtures :advertisements

  shared_examples 'public access to advertisement' do    

    describe "GET show" do      
      let(:advertisement) { advertisements(:first_advertisement) }
      let(:power_locks) { options(:power_locks) }
      let(:cd_player) { options(:cd_player) }
      let(:sunroof) { options(:sunroof) }

      it 'renders :show template' do
        get :show, id: advertisement
        expect(response).to render_template(:show)
      end

      it 'assigns requested instance variables to template' do
        get :show, id: advertisement
        expect(assigns(:advertisement)).to eq(advertisement)
        expect(assigns(:options)).to match([power_locks, cd_player, sunroof])
      end
    end
  end

  describe "guest user" do
    it_behaves_like 'public access to advertisement'

    let(:advertisement) { advertisements(:first_advertisement) }

    let(:valid_data) do
      {
        title: "Valid title for advertisement",
        price: 20000,
        year: Time.now,
        category: Category.find_by(name: "Cars"),
        vehicle_model: VehicleModel.find_by(name: "Astra G"),
        user: User.first
      }
    end

    describe "GET index" do      
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end  
    end

    describe 'GET new' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST create' do
      it "redirects to login page" do
        post :create, advertisement: FactoryGirl.attributes_for(:advertisement)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET edit' do
      it "redirects to login page" do
        get :edit, id: advertisement
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PUT update' do
      it "redirects to login page" do
        put :update, id: advertisement, advertisement: valid_data 
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE destroy" do
      it "redirects to login page" do
        delete :destroy, id: advertisement
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "authenticated user" do
    let(:user){ users(:pera) }

    before do
      sign_in(user)
    end

    it_behaves_like 'public access to advertisement'

    describe "GET index" do      
      it 'renders :index template' do
        get :index
        expect(response).to render_template :index
      end  

      it 'assigns only advertisements of this user' do
        get :index
        expect(assigns(:advertisements).count).to eq(2) 
      end
    end

    describe 'GET new' do
      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assings new advertisement and all categories object to template" do
        car_category = categories(:cars) 
        bicycle_category = categories(:bicycles) 
        truck_category = categories(:trucks)

        get :new
        expect(assigns(:advertisement)).to be_a_new(Advertisement)
        expect(assigns(:categories)).to match([car_category, bicycle_category, truck_category])
      end
    end

    describe 'POST create' do
      context 'valid data' do
        let(:valid_data) do
          {
            title: "Valid title for advertisement",
            price: 20000,
            year: Time.now,
            category: Category.find_by(name: "Cars"),
            vehicle_model: VehicleModel.find_by(name: "Astra G"),
            user: User.first,
            advertisement_informations: {},
            options: {}
          }
        end

        it 'redirect to advertisement#show' do
          # post :create, advertisement: valid_data
          # expect(response).to redirect_to(advertisement_path(assigns(:advertisement)))
        end

        it 'creates new advertisement in database' do          
          # expect{
          #   post :create, advertisement: valid_data
          #   p request
          # }.to change(Advertisement, :count).by(1)
        end
      end

      context 'invalid data' do

      end
    end

    context 'is not owner of the advertisement' do
      let(:advertisement){ advertisements(:first_advertisement) }  
      let(:valid_data) do
        {
          title: "Valid title for advertisement",
          price: 20000,
          year: Time.now,
          category: Category.find_by(name: "Cars"),
          vehicle_model: VehicleModel.find_by(name: "Astra G"),
          user: User.first,
          advertisement_informations: {},
          options: {}
        }
      end

      describe 'GET edit' do
        it 'redirects to advertisements page' do
          get :edit, id: advertisement
          expect(response).to redirect_to(advertisements_path)
        end
      end

      describe 'PUT update' do
        it 'redirects to advertisements page' do
          put :update, id: advertisement, advertisement: valid_data
          expect(response).to redirect_to(advertisements_path)
        end
      end

      describe 'DELETE destroy' do
        it 'redirects to advertisements page' do
          delete :destroy, id: advertisement
          expect(response).to redirect_to(advertisements_path)
        end
      end
    end

    context 'is owner of the advertisement' do

    end
  end

end
