require 'rails_helper'

RSpec.describe "Static pages", :type => :feature do 

	describe "Home page" do		
		it "should have title Home" do
			visit root_path
			expect(page).to have_selector("title", :text => full_title, :visible => false)
		end		

		context "User Logged In" do
			let(:valid_user){ FactoryGirl.create(:user) }

			it "should have advertisements link" do
				signin_front_page(valid_user.email, valid_user.password)
				visit root_path
				expect(page).to have_link("Advertisements", href: advertisements_path)
			end
		end

		context "User NOT Logged In" do

			it "should not have advertisements link" do
				visit root_path
				expect(page).not_to have_link("Advertisements", href: advertisements_path)		
			end
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