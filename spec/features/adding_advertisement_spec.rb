require "rails_helper"

RSpec.feature "Adding Advertisement", :feature do

	describe "Adding Advertisement feature", js: true do
		fixtures :advertisement_types
		fixtures :users
		fixtures :information_types
		fixtures :information
		fixtures :items
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

		context "testing page layout" do
			# before(:context) do
			# 	signin(users(:miroslav).email, "password", false)
			# end

			scenario "showing and hidding form when categories select changes" do
				signin_login_page(users(:miroslav).email, 'password')
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
				signin_login_page(users(:miroslav).email, 'password')
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
			end
		end # page layout

		scenario "testing cars basic information,additional information and options" do
			signin_login_page(users(:miroslav).email, 'password')
			visit new_advertisement_path
			select(categories(:cars).name, :from => 'categories')

			categories(:cars).information.basic_information.each do |info|
				if !info.items.empty?
					expect(page).to have_select("advertisement[advertisement_informations][#{info.id}]",
																			selected: "Select..." )
				else
					expect(page).to have_field("advertisement[advertisement_informations][#{info.id}]")
				end
			end

			categories(:cars).information.additional_information.each do |info|
				name = info.name.downcase.gsub(' ', '_')
				if !info.items.empty?
					expect(page).to have_select("advertisement[advertisement_informations][#{info.id}]",
																			selected: "Select..." )
				else
					expect(page).to have_field("advertisement[advertisement_informations][#{info.id}]")
				end
			end

			categories(:cars).options.each do |info|
				expect(page).to have_no_checked_field "advertisement_options_#{info.name.downcase}"
			end
		end

		scenario "testing bicycles basic information,additional information and options" do
			signin_login_page(users(:miroslav).email, 'password')
			visit new_advertisement_path
			select(categories(:bicycles).name, :from => 'categories')

			categories(:bicycles).information.basic_information.each do |info|
				if !info.items.empty?
					expect(page).to have_select("advertisement[advertisement_informations][#{info.id}]",
																			selected: "Select..." )
				else
					expect(page).to have_field("advertisement[advertisement_informations][#{info.id}]")
				end
			end

			categories(:bicycles).information.additional_information.each do |info|
				name = info.name.downcase.gsub(' ', '_')
				if !info.items.empty?
					expect(page).to have_select("advertisement[advertisement_informations][#{info.id}]",
																			selected: "Select..." )
				else
					expect(page).to have_field("advertisement[advertisement_informations][#{info.id}]")
				end
			end

			categories(:bicycles).options.each do |info|
				name = info.name.downcase.gsub(' ', '_')
				expect(page).to have_no_checked_field "advertisement_options_#{name}"
			end
		end

		context "VALIDA DATA" do
			scenario "user successfully adds cars advertisement" do
				signin_login_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:cars).name, :from => 'categories')
				select(vehicle_brands(:opel).name, from: 'vehicle_brands')
				select(vehicle_models(:astra_g).name, from: 'vm_select')

				fill_in("advertisement[title]", with: "New Advertisement")
				fill_in("advertisement[price]", with: 50000)
				fill_in("advertisement[year]", with: '2016-03-14')

				# basic advertisement informations
				categories(:cars).information.basic_information.each do |info|
					fill_in("advertisement[advertisement_informations][#{info.id}]", with: rand(1000...5000))
				end

				# additional advertisement informations
				select(items(:gasoline).name, from: "advertisement[advertisement_informations][#{information(:fuel).id}]")
				select(items(:coupe).name, from: "advertisement[advertisement_informations][#{information(:style).id}]")
				select(items(:fwd).name, from: "advertisement[advertisement_informations][#{information(:drive).id}]")
				select(items(:semi_automatic).name, from: "advertisement[advertisement_informations][#{information(:transmission).id}]")
				select(items(:manual_air_condition).name, from: "advertisement[advertisement_informations][#{information(:air_condition).id}]")
				select(items(:cylinder_10).name, from: "advertisement[advertisement_informations][#{information(:engine).id}]")
				select(items(:blue_exterior_color).name, from: "advertisement[advertisement_informations][#{information(:exterior_color).id}]")
				select(items(:gold_exterior_color).name, from: "advertisement[advertisement_informations][#{information(:interior_color).id}]")

				categories(:cars).options.each do |info|
					name = info.name.downcase.gsub(' ', '_')
					check "advertisement_options_#{name}"
				end

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.from(Advertisement.count).to(Advertisement.count + 1)

				expect(Advertisement.pending).to include(Advertisement.last)
				expect(page).to have_content "Advertisement successfully created."

				# expect that email has been sent
				expect(ActionMailer::Base.deliveries.count).to eq(1)
				expect(ActionMailer::Base.deliveries.last.to).to include(users(:miroslav).email)
			end

			scenario "user successfully adds bicycle advertisement" do
				signin_front_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:bicycles).name, :from => 'categories')
				select(vehicle_brands(:boardman).name, from: 'vehicle_brands')
				select(vehicle_models(:mountain_one).name, from: 'vm_select')

				fill_in("advertisement[title]", with: "New Bicycle Advertisement")
				fill_in("advertisement[price]", with: 1000)
				fill_in("advertisement[year]", with: '2015-03-14')

				# basic advertisement informations
				categories(:bicycles).information.basic_information.each do |info|
					if info.items.empty?
						fill_in("advertisement[advertisement_informations][#{info.id}]", with: rand(1000...5000))
					else
						select(items(:kids).name, from: "advertisement[advertisement_informations][#{info.id}]")
					end
				end

				# additional advertisement informations
				select(items(:blue_color).name, from: "advertisement[advertisement_informations][#{information(:color).id}]")
				select(items(:v_break).name, from: "advertisement[advertisement_informations][#{information(:breaks).id}]")
				select(items(:carbon).name, from: "advertisement[advertisement_informations][#{information(:material).id}]")
				select(items(:inch_17).name, from: "advertisement[advertisement_informations][#{information(:size).id}]")

				categories(:bicycles).options.each do |info|
					name = info.name.downcase.gsub(' ', '_')
					check "advertisement_options_#{name}"
				end

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.from(Advertisement.count).to(Advertisement.count + 1)

				expect(page).to have_content "Advertisement successfully created."
			end
		end

		context "INVALID DATA" do

			scenario "unsuccessful adds car advertisement" do
				signin_login_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:cars).name, :from => 'categories')

				fill_in("advertisement[title]", with: "")
				fill_in("advertisement[price]", with: "")
				fill_in("advertisement[year]", with: '')

				# basic advertisement informations
				# ...nothing

				# additional advertisement informations
				# ...nothing

				# options
				# ...nothing

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.by(0)

				expect(page).not_to have_content "Advertisement successfully created."
			end

			scenario "unsuccessful adds bicycle advertisement" do
				signin_login_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:bicycles).name, :from => 'categories')

				fill_in("advertisement[title]", with: "")
				fill_in("advertisement[price]", with: "")
				fill_in("advertisement[year]", with: '')

				# basic advertisement informations
				# ...nothing

				# additional advertisement informations
				# ...nothing

				# options
				# ...nothing

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.by(0)

				expect(page).not_to have_content "Advertisement successfully created."
			end
		end
	end
end
