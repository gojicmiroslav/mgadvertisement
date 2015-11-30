module Features
	module RegistrationHelpers

		def sign_up(firstname, lastname, email, password, password_confirmation, link_button)
			fill_in 'Firstname',  with: firstname
			fill_in 'Lastname',  with: lastname
			find('#new_user').find("input[id$='user_email']").set email
			find('#new_user').find("input[id$='user_password']").set password
			find('#new_user').find("input[id$='user_password_confirmation']").set password_confirmation
			click_button link_button
		end

	end
end