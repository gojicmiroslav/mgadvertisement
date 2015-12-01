require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	let(:user){ FactoryGirl.create(:user) }
	
	it "should redirect show when not logged in" do
		get :show, id: user.id
		expect(response).not_to render_template("show")
		expect(flash[:alert]).to eq(I18n.translate 'devise.failure.unauthenticated')
  	expect(response).to redirect_to new_user_session_path
	end

end