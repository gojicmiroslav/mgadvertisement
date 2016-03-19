require 'rails_helper'

feature 'Category buttons' do 
	
	fixtures :advertisement_types	
	fixtures :categories	
	fixtures :vehicle_brands
	fixtures :advertisements

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

	scenario "show advertisements when clicked on category button" do
		visit root_path
		# cars
		expect(page).to have_css('div.caption', text: advertisements(:first_advertisement).title)
		expect(page).to have_css('div.caption', text: advertisements(:first_advertisement).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:first_advertisement).price)

		expect(page).to have_css('div.caption', text: advertisements(:third_advertisement).title)
		expect(page).to have_css('div.caption', text: advertisements(:third_advertisement).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:third_advertisement).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_4).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_4).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_4).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_5).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_5).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_5).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_6).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_6).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_6).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_7).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_7).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_7).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_8).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_8).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_8).price)

		#check one bicycle advertisement
		expect(page).not_to have_css('div.caption', text: advertisements(:advertisement_9).title)
		expect(page).not_to have_css('div.caption', text: advertisements(:advertisement_9).category.name)
		expect(page).not_to have_css('div.caption', text: advertisements(:advertisement_9).price)

		visit category_path(categories(:bicycles))

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_9).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_9).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_9).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_10).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_10).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_10).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_11).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_11).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_11).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_12).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_12).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_12).price)

		expect(page).to have_css('div.caption', text: advertisements(:advertisement_13).title)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_13).category.name)
		expect(page).to have_css('div.caption', text: advertisements(:advertisement_13).price)

		#check one cars advertisement
		expect(page).not_to have_css('div.caption', text: advertisements(:first_advertisement).title)
		expect(page).not_to have_css('div.caption', text: advertisements(:first_advertisement).category.name)
		expect(page).not_to have_css('div.caption', text: advertisements(:first_advertisement).price)
	end
	
end