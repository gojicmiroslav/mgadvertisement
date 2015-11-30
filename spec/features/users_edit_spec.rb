require 'rails_helper'

RSpec.feature "Users Edit", :feature do

	let(:user){ FactoryGirl.create(:user) }
	let(:other_user){ FactoryGirl.create(:other_user) }
	
	scenario "should redirect edit when logged in as wrong user" do
		signin_login_page(user.email, user.password)
		visit edit_user_registration_path(other_user)

		#expect(current_path).to eq(edit_user_registration_path)
		expect(page).not_to have_content(other_user.firstname)
		expect(page).not_to have_content(other_user.lastname)
		expect(page).to have_content(user.firstname)
		expect(page).to have_content(user.lastname)
	end

end
