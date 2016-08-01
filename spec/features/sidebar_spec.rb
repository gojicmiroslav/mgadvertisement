require "rails_helper"

RSpec.feature "Sidebar", :feature do

	describe "Sidebar", js: true do
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

		let(:bicycles_category){ categories(:bicycles) }

		scenario "show sidebar for cars" do
			visit root_path
			expect(page).to have_content "Advanced Search"
			expect(page).to have_content "Vehicle Brands and Models"

			expect(page).to have_select('search_vehicle_brand', options: ['Select...',
			vehicle_brands(:opel).name,
			vehicle_brands(:volkswagen).name,
			vehicle_brands(:mercedes).name,
			vehicle_brands(:renault).name])

			select(vehicle_brands(:opel).name, :from => 'search_vehicle_brand')
			expect(page).to have_select('search_vehicle_model', options: [vehicle_models(:astra_g).name,
			vehicle_models(:astra_f).name,
			vehicle_models(:insignia).name])

			expect(page).to have_select('fuel', options: ['Select...',
													items(:gasoline).name,
													items(:diesel).name,
													items(:gasoline_and_gas).name,
													items(:alternate).name])

			expect(page).to have_select('engine', options: [ 'Select...',
													items(:cylinder_3).name,
												    items(:cylinder_4).name,
													items(:cylinder_5).name,
													items(:cylinder_6).name,
													items(:cylinder_8).name,
													items(:cylinder_10).name,
													items(:cylinder_12).name,
													items(:electric).name,
										  		    items(:hybrid).name,
  												    items(:rotary_engine).name])

			expect(page).to have_select('drive', options: [ 'Select...',
													items(:awd).name,
													items(:fwd).name,
													items(:rwd).name,
													items(:wd_4).name,
													items(:other_drive).name])

			expect(page).to have_select('air_condition', options: [ 'Select...',
															items(:automatic_air_condition).name,
															items(:manual_air_condition).name,
															items(:none_air_condition).name])

			expect(page).to have_select('transmission', options: ['Select...',
															items(:automatic).name,
														    items(:manual).name,
														    items(:semi_automatic).name,
														    items(:cvt).name,
														    items(:other_transmission).name])

			expect(page).to have_select('exterior_color', options: ['Select...',
																															items(:beige_exterior_color).name,
																															items(:blue_exterior_color).name,
																															items(:black_exterior_color).name,
																															items(:burgundy_exterior_color).name,
																															items(:charcoal_exterior_color).name,
																															items(:gold_exterior_color).name,
																															items(:gray_exterior_color).name,
																															items(:green_exterior_color).name,
																															items(:off_white_exterior_color).name,
																															items(:orange_exterior_color).name,
																															items(:pink_exterior_color).name,
																															items(:red_exterior_color).name,
																															items(:silver_exterior_color).name,
																															items(:tan_exterior_color).name,
																															items(:turquoise_exterior_color).name,
																															items(:white_exterior_color).name,
																															items(:yellow_exterior_color).name])
		end

		scenario "show sidebar for bicycles" do
			visit category_path bicycles_category
			expect(page).to have_content "Advanced Search"
			expect(page).to have_content "Vehicle Brands and Models"

			expect(page).to have_select('search_vehicle_brand', options: ["Select...",
																																		vehicle_brands(:boardman).name,
																																		vehicle_brands(:carrera).name,
																																		vehicle_brands(:apollo).name,
																																		vehicle_brands(:raleigh).name])

			select(vehicle_brands(:boardman).name, :from => 'search_vehicle_brand')
			expect(page).to have_select('search_vehicle_model', options: [vehicle_models(:mountain_one).name,
																																		vehicle_models(:mountain_two).name])

			expect(page).to have_select('type', options: ['Select...',
																										items(:bmx).name,
																										items(:cruiser).name,
																										items(:kids).name,
																										items(:classic).name,
																										items(:mountain).name,
																										items(:road).name])

			expect(page).to have_select('color', options: ['Select...',
																											items(:beige_color).name,
																											items(:blue_color).name,
																											items(:black_color).name,
																											items(:burgundy_color).name,
																											items(:charcoal_color).name,
																											items(:gold_color).name,
																											items(:gray_color).name,
																											items(:green_color).name,
																											items(:off_white_color).name,
																											items(:orange_color).name,
																											items(:pink_color).name,
																											items(:red_color).name,
																											items(:silver_color).name,
																											items(:tan_color).name,
																											items(:turquoise_color).name,
																											items(:white_color).name,
																											items(:yellow_color).name])

			expect(page).to have_select('material', options: ['Select...',
																												items(:aluminium).name,
																												items(:iron).name,
																												items(:carbon).name,
																												items(:titanium).name])

			expect(page).to have_select('size', options: ['Select...',
																										items(:inch_13).name,
																										items(:inch_14).name,
																										items(:inch_15).name,
																										items(:inch_16).name,
																										items(:inch_17).name,
																										items(:inch_18).name,
																										items(:inch_19).name,
																										items(:inch_19_5).name,
																										items(:inch_20).name])

			expect(page).to have_select('breaks', options: ['Select...',
																											items(:standard_breaks).name,
																											items(:v_break).name,
																											items(:hidraulic_breaks).name,
																											items(:mechanic_breaks).name])
		end
	end

end