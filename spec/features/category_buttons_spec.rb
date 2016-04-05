require 'rails_helper'

feature 'Category buttons' do

	fixtures :advertisement_types
	fixtures :users
	fixtures :information_types
	fixtures :information
	fixtures :items
	fixtures :categories
	fixtures :vehicle_brands
	fixtures :vehicle_models
	fixtures :options

	scenario "change category button when clicked on category" do
		visit root_path
		expect(page).to have_link(categories(:cars).name, href: root_path)
		expect(page).to have_link(categories(:trucks).name, href: category_path(categories(:trucks)))
		expect(page).to have_link(categories(:bicycles).name, href: category_path(categories(:bicycles)))

		visit category_path(categories(:bicycles))
		expect(page).to have_link(categories(:cars).name, href: root_path)
		expect(page).to have_link(categories(:trucks).name, href: category_path(categories(:trucks)))
		expect(page).to have_link(categories(:bicycles).name, href: category_path(categories(:bicycles)))

		visit category_path(categories(:trucks))
		expect(page).to have_link(categories(:cars).name, href: root_path)
		expect(page).to have_link(categories(:trucks).name, href: category_path(categories(:trucks)))
		expect(page).to have_link(categories(:bicycles).name, href: category_path(categories(:bicycles)))
	end

end
