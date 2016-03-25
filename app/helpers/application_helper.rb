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
	
  def generate_price_select(name, id)
    html = <<-HTML
    <select class="form-control" name='#{name}' id='#{id}'>
      <option value="">Any</option>
      <option value="1000">1000€</option>
      <option value="2000">2000€</option>
      <option value="3000">3000€</option>
      <option value="4000">4000€</option>
      <option value="5000">5000€</option>
      <option value="6000">6000€</option>
      <option value="7000">7000€</option>
      <option value="8000">8000€</option>
      <option value="9000">9000€</option>
      <option value="10000">10000€</option>
      <option value="15000">15000€</option>
      <option value="20000">20000€</option>
      <option value="25000">25000€</option>
      <option value="30000">30000€</option>
      <option value="35000">35000€</option>
      <option value="40000">40000€</option>
      <option value="45000">45000€</option>
      <option value="50000">50000€</option>
      <option value="55000">55000€</option>
      <option value="60000">60000€</option>
      <option value="65000">65000€</option>
      <option value="70000">70000€</option>
      <option value="75000">75000€</option>
      <option value="80000">80000€</option>
      <option value="80000">85000€</option>
      <option value="90000">90000€</option>
      <option value="95000">95000€</option>
      <option value="100000">100000€</option>
    </select>
    HTML
  end

  def print_sidebar_panel(title, select_name, items_name)
    panel = "<div class='panel panel-primary'>"
    panel += "<div class='panel-heading'>"
    panel += "<h3 class='panel-title'>#{title}</h3>"
    panel += "</div>"
    panel += "<div class='panel-body'>"  
    panel += select_tag select_name, options_from_collection_for_select(Information.get_all_information_items(items_name), "id", "name") , prompt: "Select...", class: "form-control" 
    panel += "</div>"
    panel += "</div>"
    raw panel
  end

  def generate_closing_div(advertisement_length)
    if advertisement_length < 9 
      if (advertisement_length == 1) || (advertisement_length == 2) || (advertisement_length == 4) ||
         (advertisement_length == 5) || (advertisement_length == 7) || (advertisement_length == 8) 
        return raw("</div>")
      end
    else 
      if ((advertisement_length % 9) == 1) || ((advertisement_length % 9) == 2) || 
         ((advertisement_length % 9) == 4) || ((advertisement_length % 9) == 5) || 
         ((advertisement_length % 9) == 7) || ((advertisement_length % 9) == 8)    
        return raw("</div>")
      end 
    end
  end

end
