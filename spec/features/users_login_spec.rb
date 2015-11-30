require 'rails_helper'

RSpec.feature "Users Login", :device do

	#======INVALID LOGIN=========================================
	context "INVALID DATA" do
		
		context "HOME page login form" do

			scenario "login with invalid email and password" do
				visit root_path

				signin_front_page("someone@invalid", "somepassword")

				# expect redirect
				expect(current_path).to eq(new_user_session_path)
				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end

			scenario "login with empty email and password" do
				visit root_path

				signin_front_page("", "")

				# expect redirect
				expect(current_path).to eq(new_user_session_path)
				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end

			scenario "login with empty email" do
				visit root_path

				signin_front_page("", "somepassword")

				# expect redirect
				expect(current_path).to eq(new_user_session_path)
				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end

			scenario "login with empty password" do
				visit root_path

				signin_front_page("", "somepassword")

				# expect redirect
				expect(current_path).to eq(new_user_session_path)
				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end
			
		end

		context "LOGIN page login form" do

			scenario "login with invalid email and password" do
				visit new_user_session_path
				expect(page).to have_css("h1", text: "Log In")
				expect(page).to have_title(full_title("Log In"))

				signin_login_page("someone@invalid", "somepassword", false)

				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end

			scenario "login with empty email and password" do
				visit new_user_session_path
				expect(page).to have_css("h1", text: "Log In")
				expect(page).to have_title(full_title("Log In"))

				signin_login_page("", "", false)

				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end

			scenario "login with empty email" do
				visit new_user_session_path
				expect(page).to have_css("h1", text: "Log In")
				expect(page).to have_title(full_title("Log In"))

				signin_login_page("", "somepassword", false)

				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end

			scenario "login with empty password" do
				visit new_user_session_path
				expect(page).to have_css("h1", text: "Log In")
				expect(page).to have_title(full_title("Log In"))

				signin_login_page("someone@invalid", "", false)

				expect(page).to have_css('div.alert')
				expect(page).not_to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_content(I18n.translate 'devise.failure.not_found_in_database')

				visit root_path

				expect(page).not_to have_css('div.alert')
			end
		end
	end

	#======VALID LOGIN=========================================
	context "VALID DATA" do

		let(:valid_user){ FactoryGirl.create(:user) }
		
		context "Login Without REMEMBERING" do
			scenario "HOME page login form" do
				visit root_url
				signin_front_page(valid_user.email, valid_user.password)
				
				expect(page).to have_content(I18n.translate 'devise.sessions.signed_in')

				expect(page).to have_link "Logout", href: destroy_user_session_path
				expect(page).to have_link "Settings", href: edit_user_registration_path

				click_on "Logout"
				expect(page).to have_content(I18n.translate 'devise.sessions.signed_out')
				expect(page.current_url).to eq(root_url)
			end

			scenario "LOGIN page login form followed by logout" do
				visit new_user_session_path
				expect(page).to have_css("h1", text: "Log In")
				expect(page).to have_title(full_title("Log In"))

				signin_login_page(valid_user.email, valid_user.password, false)
				expect(page).to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_link "Logout", href: destroy_user_session_path
				expect(page).to have_link "Settings", href: edit_user_registration_path

				click_on "Logout"
				expect(page).to have_content(I18n.translate 'devise.sessions.signed_out')
				expect(page.current_url).to eq(root_url)
			end
		end

		context "Login With REMEMBERING" do
			
			scenario "HOME page login form with remembering" do
				visit new_user_session_path
				expect(page).to have_css("h1", text: "Log In")
				expect(page).to have_title(full_title("Log In"))

				signin_login_page(valid_user.email, valid_user.password, true)
				expect(get_me_the_cookie("remember_user_token")).not_to be_nil

				expect(page).to have_content(I18n.translate 'devise.sessions.signed_in')
				expect(page).to have_link "Logout", href: destroy_user_session_path
				expect(page).to have_link "Settings", href: edit_user_registration_path

				expire_cookies

				visit root_url

				expect(page).to have_content("Logout")
			end
		end

	end
  
	
end