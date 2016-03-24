require 'rails_helper'

feature "Pagination" do
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

	shared_examples "shows div pagination" do
		it 'shows div pagination' do
			expect(page).to have_css('div.pagination')
		end
	end

	describe "Home page", js: true do
		# 11 advertisements
		before do
			visit root_path
		end

		it_behaves_like "shows div pagination"

		it "displays div.row for every three advertisement" do
			expect(page).to have_css('div#advertisement_row_0')
			expect(page).to have_css('div#advertisement_row_3')
			expect(page).to have_css('div#advertisement_row_6')
		end
	end

	describe "Show page Bicycles" do
		# 10 advertisements
		before do
			visit "/categories/#{categories(:bicycles).id}"
		end

		it_behaves_like "shows div pagination"
	end

	describe "Show page Trucks" do
		# 1 advertisements
		before do
			visit "/categories/#{categories(:trucks).id}"
		end

		it 'shows div pagination' do
			expect(page).not_to have_css('div.pagination')
		end
	end

end