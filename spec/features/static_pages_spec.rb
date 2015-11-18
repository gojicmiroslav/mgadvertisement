require 'rails_helper'

RSpec.describe "Static pages", :type => :feature do 

	describe "Home page" do		
		it "should have title Home" do
			visit root_path
			expect(page).to have_selector("title", :text => full_title, :visible => false)
		end		
	end

	describe "About page" do		
		it "should have title About" do
			visit about_path
			expect(page).to have_selector("title", :text => full_title("About"), :visible => false)
		end		
	end

	describe "Contact page" do		
		it "should have title Contact" do
			visit contact_path
			expect(page).to have_selector("title", :text => full_title("Contact"), :visible => false)
		end		
	end

	describe "Help page" do		
		it "should have title Help" do
			visit help_path
			expect(page).to have_selector("title", :text => full_title("Help"), :visible => false)
		end		
	end
end