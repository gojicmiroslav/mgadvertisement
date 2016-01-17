module ApplicationHelper

	# Returns  the full title on a per-page basis	
	def full_title(page_title = '')
		base_title = "MG Advertisement"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def flash_class(type)
		case type
  		when 'notice'
  			'alert alert-success'
  		when 'alert'
  			'alert alert-danger'
      when 'success'
        'alert alert-success'
  		else	
  			type
  		end
	end

	def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end
	
end
