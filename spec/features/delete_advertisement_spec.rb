require "rails_helper"

RSpec.feature "Delete Advertisement", :feature do
	
	describe "Deleting Advertisement feature" do
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

		scenario "delete advertisement" do
			signin_front_page(users(:miroslav).email, 'password')
			visit advertisements_path

			expect do
				first(:link, "Delete").click
			end.to change {Advertisement.count}.from(Advertisement.count).to(Advertisement.count - 1)		
		end
	end
end