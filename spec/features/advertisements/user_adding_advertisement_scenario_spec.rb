require "rails_helper"

RSpec.feature "User adding advertisement scenario" do

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
	fixtures :admin

	let!(:pending_advertisement) { advertisements(:car_pending_advertisement) }
	let!(:admin_one) { admin(:admin_one) }

	scenario "admin aprove advertisement" do
		visit '/admin'
		fill_in("admin[email]", with: admin_one.email)
		fill_in("admin[password]", with: "password")
		click_on("Login")

		expect(page).to have_content("Dashboard")
		click_on("Advertisements")
		expect(page).to have_content('Advertisements')
		visit edit_admin_advertisement_path(pending_advertisement)
		#expect(page).to have_content("Edit Advertisement")
		#expect(page).to have_content(pending_advertisement.vehicle_model)
	end

	scenario "admin reject advertisement" do

	end
end