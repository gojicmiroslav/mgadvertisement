require "rails_helper"

RSpec.feature "Edit Advertisement", :feature do
	
	describe "Edit Advertisement feature", js: true do
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
		fixtures :advertisement_information

		before(:all) do
			Capybara.register_driver :poltergeist do |app|
    		Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
			end
			Capybara.javascript_driver = :poltergeist
		end

		after(:all) do
  		Capybara.use_default_driver
		end

		# car
		let(:car_advertisement) { advertisements(:first_advertisement) }
		let(:capacity) { information(:capacity) }
		let(:power) { information(:power) }
		let(:mileage) { information(:mileage) }
		let(:type) { information(:type) }
		let(:fuel) { information(:fuel) }
		let(:style) { information(:style) }
		let(:drive) { information(:drive) }
		let(:transmission) { information(:transmission) }
		let(:air_condition) { information(:air_condition) }
		let(:engine) { information(:engine) }
		let(:exterior_color) { information(:exterior_color) }
		let(:interior_color) { information(:interior_color) }
		let(:capacity_advertisement_information) { advertisement_information(:capacity_advertisement_information) }
		let(:power_advertisement_information) { advertisement_information(:power_advertisement_information) }
		let(:mileage_advertisement_information) { advertisement_information(:mileage_advertisement_information) }
		let(:fuel_advertisement_information) { advertisement_information(:fuel_advertisement_information) }
		let(:style_advertisement_information) { advertisement_information(:style_advertisement_information) }
		let(:drive_advertisement_information) { advertisement_information(:drive_advertisement_information) }
		let(:transmission_advertisement_information) { advertisement_information(:transmission_advertisement_information) }
		let(:air_condition_advertisement_information) { advertisement_information(:air_condition_advertisement_information) }
		let(:engine_advertisement_information) { advertisement_information(:engine_advertisement_information) }
		let(:exterior_color_advertisement_information) { advertisement_information(:exterior_color_advertisement_information) }
		let(:interior_color_advertisement_information) { advertisement_information(:interior_color_advertisement_information) }
		let(:gasoline){ items(:gasoline) }
		let(:coupe){ items(:coupe) }
		let(:fwd){ items(:fwd) }
		let(:semi_automatic){ items(:semi_automatic) }
		let(:manual_air_condition){ items(:manual_air_condition) }
		let(:cylinder_10){ items(:cylinder_10) }
		let(:blue_exterior_color){ items(:blue_exterior_color) }
		let(:gold_exterior_color){ items(:gold_exterior_color) }

		#bicycle
		let(:bicycle_advertisement) { advertisements(:second_advertisement) }
		let(:type_advertisement_information) { advertisement_information(:type_advertisement_information) }
		let(:color) { information(:color) }
		let(:breaks) { information(:breaks) }
		let(:material) { information(:material) }
		let(:size) { information(:size) }
		let(:color_advertisement_information) { advertisement_information(:color_advertisement_information) }
		let(:break_advertisement_information) { advertisement_information(:break_advertisement_information) }
		let(:material_advertisement_information) { advertisement_information(:material_advertisement_information) }
		let(:size_advertisement_information) { advertisement_information(:size_advertisement_information) }
		let(:cruiser){ items(:cruiser) } 
		let(:blue_color){ items(:blue_color) }
		let(:mechanic_breaks){ items(:mechanic_breaks) }
		let(:aluminium){ items(:aluminium) }
		let(:inch_18){ items(:inch_18) }

		context "testing page layout" do
			scenario "edit cars layout" do
				visit edit_advertisement_path(car_advertisement)

				expect(page).to have_content(car_advertisement.category.name)
				expect(page).to have_field("advertisement[title]", with: car_advertisement.title)
				expect(page).to have_field("advertisement[description]", with: car_advertisement.description)
				expect(page).to have_field("advertisement[price]", with: car_advertisement.price)
				expect(page).to have_field("advertisement[year]", with: car_advertisement.year)

				# basic advertisement informations
				expect(page).to have_field("advertisement[advertisement_informations][#{capacity.id}]", 
																		with: capacity_advertisement_information.value)
				expect(page).to have_field("advertisement[advertisement_informations][#{power.id}]", 
																		with: power_advertisement_information.value)
				expect(page).to have_field("advertisement[advertisement_informations][#{mileage.id}]", 
																		with: mileage_advertisement_information.value)			

				# additional advertisement informations		
				expect(page).to have_select("advertisement[advertisement_informations][#{fuel.id}]", 
																		selected: fuel_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{style.id}]", 
																		selected: style_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{drive.id}]", 
																		selected: drive_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{transmission.id}]", 
																		selected: transmission_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{air_condition.id}]", 
																		selected: air_condition_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{engine.id}]", 
																		selected: engine_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{exterior_color.id}]", 
																		selected: exterior_color_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{interior_color.id}]", 
																		selected: interior_color_advertisement_information.value)

				# options
				car_advertisement.category.options.each_with_index do |option, index|
					expect(page).to have_content(option.name)

					if car_advertisement.options.exists?(option.id)
						expect(page).to have_checked_field "advertisement[options_attributes][#{index}][name][]"
					else
						expect(page).to have_no_checked_field "advertisement[options_attributes][#{index}][name][]"
					end
				end
			end			

			scenario "edit bicycles layout" do
				visit edit_advertisement_path(bicycle_advertisement)

				expect(page).to have_content(bicycle_advertisement.category.name)
				expect(page).to have_field("advertisement[price]", with: bicycle_advertisement.price)
				expect(page).to have_field("advertisement[year]", with: bicycle_advertisement.year)

				# basic advertisement informations
				expect(page).to have_select("advertisement[advertisement_informations][#{type.id}]", 
																		selected: type_advertisement_information.value)																	

				# additional advertisement informations
				expect(page).to have_select("advertisement[advertisement_informations][#{color.id}]", 
																		selected: color_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{breaks.id}]", 
																		selected: break_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{material.id}]", 
																		selected: material_advertisement_information.value)
				expect(page).to have_select("advertisement[advertisement_informations][#{size.id}]", 
																		selected: size_advertisement_information.value)

				# options
				bicycle_advertisement.category.options.each_with_index do |option, index|
					expect(page).to have_content(option.name)

					if bicycle_advertisement.options.exists?(option.id)
						expect(page).to have_checked_field "advertisement[options_attributes][#{index}][name][]"
					else
						expect(page).to have_no_checked_field "advertisement[options_attributes][#{index}][name][]"
					end
				end
			end
		end	

		context "VALIDA DATA" do
			scenario "user successfully edit cars advertisement" do
				visit edit_advertisement_path(car_advertisement)
				fill_in("advertisement[title]", with: "2010 BMW 530 D GT - Edited")
				fill_in("advertisement[price]", with: 30000)

				# basic advertisement informations
				fill_in("advertisement[advertisement_informations][#{capacity.id}]", with: 3000)
				fill_in("advertisement[advertisement_informations][#{power.id}]", with: 3500)
				fill_in("advertisement[advertisement_informations][#{mileage.id}]", with: 2500)	

				# additional advertisement informations	
				select(gasoline.name, from: "advertisement[advertisement_informations][#{fuel.id}]")
				select(coupe.name, from: "advertisement[advertisement_informations][#{style.id}]") 
				select(fwd.name, from: "advertisement[advertisement_informations][#{drive.id}]")
				select(semi_automatic.name, from: "advertisement[advertisement_informations][#{transmission.id}]")
				select(manual_air_condition.name, from: "advertisement[advertisement_informations][#{air_condition.id}]")
				select(cylinder_10.name, from: "advertisement[advertisement_informations][#{engine.id}]")
				select(blue_exterior_color.name, from: "advertisement[advertisement_informations][#{exterior_color.id}]")
				select(gold_exterior_color.name, from: "advertisement[advertisement_informations][#{interior_color.id}]")

				# options
				car_advertisement.category.options.each_with_index do |option, index|
					if bicycle_advertisement.options.exists?(option.id)
						uncheck "advertisement[options_attributes][#{index}][name][]"
					else
						check "advertisement[options_attributes][#{index}][name][]"
					end
				end

				click_button "Edit advertisement"
				expect(page).to have_content("Advertisement successfully updated.")
			end

			scenario "user successfully edit bicycles advertisement" do
				visit edit_advertisement_path(bicycle_advertisement)												
				fill_in("advertisement[title]", with: "Mountain Bike Boardman - Edited")
				fill_in("advertisement[price]", with: 4000)

				# basic advertisement informations
				select(cruiser.name , from: "advertisement[advertisement_informations][#{type.id}]")

				# additional advertisement informations
				select(blue_color.name, from: "advertisement[advertisement_informations][#{color.id}]")
				select(mechanic_breaks.name, from: "advertisement[advertisement_informations][#{breaks.id}]")
				select(aluminium.name, from: "advertisement[advertisement_informations][#{material.id}]")
				select(inch_18.name, from: "advertisement[advertisement_informations][#{size.id}]")

				# options
				bicycle_advertisement.category.options.each_with_index do |option, index|
					if bicycle_advertisement.options.exists?(option.id)
						uncheck "advertisement[options_attributes][#{index}][name][]"
					else
						check "advertisement[options_attributes][#{index}][name][]"
					end
				end

				click_button "Edit advertisement"
				expect(page).to have_content("Advertisement successfully updated.")
			end
		end # context VALID DATA

		context "INVALID DATA" do			
			scenario "unsuccessful edit car advertisement" do
				visit edit_advertisement_path(car_advertisement)
				fill_in("advertisement[title]", with: "")
				fill_in("advertisement[price]", with: "")
				fill_in("advertisement[year]", with: "")

				# basic advertisement informations
				fill_in("advertisement[advertisement_informations][#{capacity.id}]", with: "")
				fill_in("advertisement[advertisement_informations][#{power.id}]", with: "")
				fill_in("advertisement[advertisement_informations][#{mileage.id}]", with: "")	

				click_button "Edit advertisement"
				expect(page).not_to have_content("Advertisement successfully updated.")
			end

			scenario "unsuccessful edit bicycle advertisement" do
				visit edit_advertisement_path(bicycle_advertisement)
				fill_in("advertisement[title]", with: "")
				fill_in("advertisement[price]", with: "")
				fill_in("advertisement[year]", with: "")

				click_button "Edit advertisement"
				expect(page).not_to have_content("Advertisement successfully updated.")
			end
		end # context INVALID DATA
	end
	
end