require 'rails_helper'

feature 'show active advertisements' do
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
	
	scenario "show only active car advertisements" do
		visit '/'

		expect(page).not_to have_content(advertisements(:car_pending_advertisement).title)
		expect(page).not_to have_content(advertisements(:car_inactive_advertisement).title)
		expect(page).to have_content(advertisements(:first_advertisement).title)
	end

	scenario "show only active bicycle advertisements" do
		visit '/'
		click_on('Bicycles')

		expect(page).not_to have_content(advertisements(:bicycle_pending_advertisement).title)
		expect(page).not_to have_content(advertisements(:bicycle_inactive_advertisement).title)
		expect(page).to have_content(advertisements(:second_advertisement).title)
	end

end