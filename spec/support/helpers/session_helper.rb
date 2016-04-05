module Features
	module SessionHelpers

		def signin_login_page(email, password, remember_me = false)
	    visit new_user_session_path
	    find(".form-signin").find('#new_user').find("input[id$='user_email']").set email
	    find(".form-signin").find('#new_user').find("input[id$='user_password']").set password
	    check("Remember me") if remember_me
	    find(".form-signin").find('#new_user').find("input[type=submit]").click
	  end

	  def signin_front_page(email, password)
	    visit new_user_session_path
	    find(".navbar").find("input[id$='user_email']").set email
	    find(".navbar").find("input[id$='user_password']").set password
	    find(".navbar").find("input[type=submit]").click
	  end

		def admin_login(email, password)
			visit '/admin/login'
			fill_in("admin[email]", with: email)
			fill_in("admin[password]", with: password)
			click_on("Login")
		end

	  def logged_as(user)
	    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
	  end
	end
end
