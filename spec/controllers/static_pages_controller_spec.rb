require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
	
	describe "GET #index" do

		it "should responds successfully with an HTTP 200 status code" do
			get :home
			expect(response).to have_http_status(200)
		end

		it "should render the home template" do
			get :home
			expect(response).to render_template("home")
		end

	end

	describe "GET #contact" do

		it "should responds successfully with an HTTP 200 status code" do
			get :contact
			expect(response).to have_http_status(200)
		end

		it "should render the contact template" do
			get :contact
			expect(response).to render_template("contact")
		end

	end

	describe "GET #about" do

		it "should responds successfully with an HTTP 200 status code" do
			get :about
			expect(response).to have_http_status(200)
		end

		it "should render the about template" do
			get :about
			expect(response).to render_template("about")
		end

	end

	describe "GET #help" do

		it "should responds successfully with an HTTP 200 status code" do
			get :help
			expect(response).to have_http_status(200)
		end

		it "should render the help template" do
			get :help
			expect(response).to render_template("help")
		end

	end

end