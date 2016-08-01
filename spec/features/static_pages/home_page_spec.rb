require "rails_helper"

RSpec.feature "Home page" do

	fixtures :advertisement_types	
	fixtures :categories	
	fixtures :vehicle_brands
	fixtures :advertisements

	let(:active_advertisement){ advertisements(:first_advertisement) }
	let(:rejected_advertisement){ advertisements(:car_rejected_advertisement) }
	let(:inactive_advertisement){ advertisements(:car_inactive_advertisement) }
	let(:pending_advertisement){ advertisements(:car_pending_advertisement) }

	context "User Logged In" do
		let(:valid_user){ FactoryGirl.create(:user) }

		it "should have advertisements link" do
			signin_front_page(valid_user.email, valid_user.password)
			visit root_path
			expect(page).to have_link("Advertisements", href: advertisements_path)
		end
	end

	context "User NOT Logged In" do
		it "should not have advertisements link" do
			visit root_path
			expect(page).not_to have_link("Advertisements", href: advertisements_path)		
		end
	end

	scenario "it shows only active advertisements" do
		visit root_path

		expect(page).to have_content(active_advertisement.title)
		expect(page).not_to have_content(rejected_advertisement)
		expect(page).not_to have_content(inactive_advertisement)
		expect(page).not_to have_content(pending_advertisement)
	end

end