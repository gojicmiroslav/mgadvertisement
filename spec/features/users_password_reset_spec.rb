require 'rails_helper'

RSpec.feature "Users Password Reset", :device do

	let(:user){ FactoryGirl.create(:user) }
	let(:new_password) { 'Passw0rd!' }

	scenario "password reset" do
		visit new_user_session_path
		click_link "Forgot your password?"

		expect(page).to have_content("Forgot your password?")

		find(".form-signin").find('#new_user').find("input[id$='user_email']").set user.email
    expect do
      click_button 'Send me reset password instructions'
    end.to change(ActionMailer::Base.deliveries, :count).by(1)

    expect(page).to have_content(I18n.t("devise.passwords.send_instructions"))

    expect(unread_emails_for(user.email)).to be_present
    open_email(user.email, with_subject: 'Reset password instructions')
    click_first_link_in_email
    expect(page).to have_content("Change your password")

    #Invalid password - empty password
    find(".form-signin").find('form').find("input[id$='user_password']").set ""
    find(".form-signin").find('form').find("input[id$='user_password_confirmation']").set ""
    click_button 'Change my password'    
    expect(page).to have_content("Password can't be blank")

    #Invalid password - empty password, but valid password confirmation
    find(".form-signin").find('form').find("input[id$='user_password']").set ""
    find(".form-signin").find('form').find("input[id$='user_password_confirmation']").set new_password
    click_button 'Change my password'    
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Password confirmation doesn't match Password")

    #Invalid password - empty password confirmation, but valid password
    find(".form-signin").find('form').find("input[id$='user_password']").set new_password
    find(".form-signin").find('form').find("input[id$='user_password_confirmation']").set ""
    click_button 'Change my password' 
    expect(page).to have_content("Password confirmation doesn't match Password")

    #Invalid password - too short password - minimum 8 characters
    find(".form-signin").find('form').find("input[id$='user_password']").set "12345"
    find(".form-signin").find('form').find("input[id$='user_password_confirmation']").set "12345"
    click_button 'Change my password' 
    expect(page).to have_content("Password is too short")

    #Invalid password - Password confirmation doesn't match Password
    find(".form-signin").find('form').find("input[id$='user_password']").set new_password
    find(".form-signin").find('form').find("input[id$='user_password_confirmation']").set "123456789"
    click_button 'Change my password' 
    expect(page).to have_content("Password confirmation doesn't match Password")

    # valid password and password confirmation
    find(".form-signin").find('form').find("input[id$='user_password']").set new_password
    find(".form-signin").find('form').find("input[id$='user_password_confirmation']").set new_password
    click_button 'Change my password' 

    expect(page).to have_content(I18n.t("devise.passwords.updated"))
    first(:link, "Logout").click
    first(:link, "Log In").click

    signin_front_page(user.email, new_password)
    expect(page).to have_content I18n.t("devise.sessions.signed_in")
	end
	
end