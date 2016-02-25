require "rails_helper"

RSpec.feature "Users Adding Advertisement", :feature do
	
	describe "Adding Advertisement Form", js: true do
		fixtures :information_types
		fixtures :categories	
		fixtures :vehicle_brands
		fixtures :vehicle_models
		fixtures :options

		before(:all) do
			Capybara.register_driver :poltergeist do |app|
    		Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
			end
			Capybara.javascript_driver = :poltergeist
		end

		after(:all) do
  		Capybara.use_default_driver
		end

		scenario "showing and hidding form when categories select changes" do
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

		scenario "testing select vehicle brands and vehicle models" do
			visit new_advertisement_path
			select(categories(:cars).name, :from => 'categories')
			expect(page).to have_select('vehicle_brands')
			wait_for_ajax
			page.driver.network_traffic.each do |request|
				request.response_parts.uniq(&:url).each do |response|
					puts "\n Response URL #{response.url}; \n Status #{response.status} \n Headers #{response.headers}"
				end
			end
			select(vehicle_brands(:opel).name, from: 'vehicle_brands')
			expect(page).to have_select('vm_select',selected: "Select...")
			select(vehicle_models(:astra_g).name, from: 'vm_select')

			fill_in('advertisement_title', :with => 'Test Title')
			fill_in('advertisement_description', :with => 'Test Description')

			fill_in('advertisement_price', :with => '3000.00')
			fill_in('advertisement_year', :with => '2003-01-01')
			#fill_in('advertisement_capacity', :with => '2000')
			#fill_in('advertisement_power', :with => '2500')
			#fill_in('advertisement_mileage', :with => '195000')		
		end

		xscenario "test aditional information" do
			visit new_advertisement_path
			select(categories(:cars).name, :from => 'categories')
		end	

	  scenario "test options" do
			visit new_advertisement_path
			select(categories(:cars).name, :from => 'categories')
			#save_screenshot('screenshot.png')

			# test cars options
			expect(page).to have_no_checked_field(options(:navigation).name)
			expect(page).to have_no_checked_field(options(:cd_player).name)
			expect(page).to have_no_checked_field(options(:dvd_player).name)
			expect(page).to have_no_checked_field(options(:sunroof).name)
			expect(page).to have_no_checked_field(options(:power_locks).name)

			# ima bag	
			#expect(page).not_to have_no_checked_field(options(:heated_seats).name)
			#expect(page).not_to have_no_checked_field(options(:back_break).name)			
			#expect(page).not_to have_no_checked_field(options(:lights).name)			

			select(categories(:trucks).name, :from => 'categories')		
			expect(page).to have_no_checked_field(options(:navigation).name)
			expect(page).to have_no_checked_field(options(:cd_player).name)
			expect(page).to have_no_checked_field(options(:dvd_player).name)
			expect(page).to have_no_checked_field(options(:power_locks).name)
			expect(page).to have_no_checked_field(options(:heated_seats).name)
		end

		xscenario "invalid data" do
			visit new_advertisement_path
		end
	end

end