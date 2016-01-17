require "rails_helper"

RSpec.feature "Users Adding Advertisement", :feature do
	
	describe "Adding Advertisement Form", js: true do
		fixtures :categories	

		before(:all) do
  		Capybara.current_driver = :selenium
		end

		after(:all) do
  		Capybara.use_default_driver
		end

		scenario "testing showing and hidding form" do
			visit new_advertisement_path	
			expect(page).to have_select('categories', selected: "Select...")
			expect(page).to have_content('Please select category to continue. Thank you!')
			expect(page).not_to have_css('#show-form')

			select(categories(:cars).name, :from => 'categories')
			expect(page).not_to have_content('Please select category to continue. Thank you!')
			expect(page).to have_css('#show-form')	

			select("Select...", :from => 'categories')
			expect(page).to have_content('Please select category to continue. Thank you!')
			expect(page).not_to have_css('#show-form')	

			select(categories(:trucks).name, :from => 'categories')
			expect(page).not_to have_content('Please select category to continue. Thank you!')
			expect(page).to have_css('#show-form')	

			select("Select...", :from => 'categories')
			expect(page).to have_content('Please select category to continue. Thank you!')
			expect(page).not_to have_css('#show-form')	

			select(categories(:bicycles).name, :from => 'categories')
			expect(page).not_to have_content('Please select category to continue. Thank you!')
			expect(page).to have_css('#show-form')		
		end
	end

end