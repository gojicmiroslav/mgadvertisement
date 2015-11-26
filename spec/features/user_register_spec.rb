require 'rails_helper'

RSpec.feature "User Register", :feature do

	let(:invalid_user) do
		User.create(firstname: "",
								lastname: "", 
								email: Faker::Internet.email, 
								password: 'foo',
								password_confirmation: "bar") 
	end

	let(:valid_user) do
		User.create(firstname: "Test",
								lastname: "User",
								email: "test@gmail.com",
								password: "password",
								password_confirmation: "password")
	end

	#======INVALID REGISTRATION=========================================
	context "INVALID DATA" do

		scenario "invalid register information" do
			visit "/"
			click_link "Register"
			expect(current_path).to eq(new_user_registration_path)

			expect do
				sign_up(invalid_user.firstname, invalid_user.lastname, invalid_user.email, 
								invalid_user.password, invalid_user.password_confirmation, 'Register')
			end.not_to change{User.count}
		end

		#---Invalid Firstname------------------------------------------------------------------
		context "Invalid Firstname" do
			scenario "empty Firstname" do
				valid_user.firstname = ""
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(invalid_user.firstname, invalid_user.lastname, invalid_user.email, 
									invalid_user.password, invalid_user.password_confirmation, 'Register')

				expect(page).to have_content("Firstname can't be blank")
			end

			scenario "Firstname over 100 characters" do
				valid_user.firstname = "a" * 101
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Firstname is too long")
			end
		end

		#---Invalid Lastname------------------------------------------------------------------
		context "Invalid Lastname" do
			scenario "empty Lastname" do
				valid_user.lastname = ""
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Lastname can't be blank")
			end

			scenario "Lastname over 100 characters" do
				valid_user.lastname = "a" * 101
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Lastname is too long")
			end
		end

		#---Invalid Email------------------------------------------------------------------
		context "Invalid Email" do
			scenario "empty Email" do
				valid_user.email = ""
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Email can't be blank")
			end

			scenario "invalid Email" do
				valid_user.email = "invalid@invalid"
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Email is invalid")
			end
		end

		#---Invalid Email------------------------------------------------------------------
		context "Invalid Password" do
			scenario "empty Password" do
				valid_user.password = ""
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Password can't be blank")
			end

			scenario "Password too short" do
				valid_user.password = "123"
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Password is too short")
			end

			scenario "password and password_confirmation doesn't match" do
				valid_user.password = "password123"
				valid_user.password_confirmation = "password321"
				visit "/"
				click_link "Register"
				expect(current_path).to eq(new_user_registration_path)
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
									valid_user.password, valid_user.password_confirmation, 'Register')

				expect(page).to have_content("Password confirmation doesn't match Password")
			end
		end

	end
		

	#======VALID REGISTRATION===========================================
	context "VALID DATA" do
		
		scenario "valid register information should change database" do
			visit new_user_registration_path
			expect(page).to have_content("Register")

			expect do
				sign_up(valid_user.firstname, valid_user.lastname, valid_user.email, 
								valid_user.password, valid_user.password_confirmation, 'Register')
			end.to change{User.count}.from(User.count).to(User.count + 1)
		end

		scenario 'visitor can register with valid email address and password' do
			visit new_user_registration_path

			#Creating credentials
			firstname = "Test"
			lastname = "User"
			email = Faker::Internet.email
			password = "password123"

	    fill_in 'Firstname',  with: firstname
			fill_in 'Lastname',  with: lastname
			find('#new_user').find("input[id$='user_email']").set email
			find('#new_user').find("input[id$='user_password']").set password
			find('#new_user').find("input[id$='user_password_confirmation']").set password
			click_button "Register"
	    txts = [I18n.t( 'devise.registrations.signed_up'), 
	    				I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
	    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
	  end

	end

	private

	def sign_up(firstname, lastname, email, password, password_confirmation, link_button)
		fill_in 'Firstname',  with: firstname
		fill_in 'Lastname',  with: lastname
		find('#new_user').find("input[id$='user_email']").set email
		find('#new_user').find("input[id$='user_password']").set password
		find('#new_user').find("input[id$='user_password_confirmation']").set password_confirmation
		click_button link_button
	end

end