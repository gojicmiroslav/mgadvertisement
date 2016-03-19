
jQuery( "#advertisement_year" ).datepicker({
  showOn: "button",
  buttonImage: "/images/calendar.gif",
  buttonImageOnly: true,
  buttonText: "Select date",
  dateFormat: "yy-mm-dd"
});

var validator = $('#advertisement_form').validate({ // initialize the plugin
    rules: {
    	vehicle_brands: "required",
      'advertisement[title]': {
          required: true,
          minlength: 10
      },
      'advertisement[price]': "required",
      'advertisement[year]': "required"
    },

    messages: {
    	vehicle_brands: {
    		required: "Please select a vehicle brand"
    	},
    	'advertisement[title]': {
          required: "Please enter a title",
          minlength: "Your title must be at least 10 characters long."
      },
      'advertisement[price]': {
      		required: "Please enter a price",
      },
      'advertisement[year]': {
      		required: "Please enter a year",	
      }
    }
});


//ovo u poseban fajl
(function($){

	$.fn.visible = function(){
		return $(this).css('visibility', 'hidden');
	};

	$.fn.invisible = function(){
		return $(this).css('visibility', 'visible');
	};

	$.fn.visibilityToggle = function(){
		return $(this).css('visibility', function(){
			return (visiblity === 'visible') ? 'hidden' : 'visible';
		});
	};

}(jQuery));

//modul - u poseban fajl
printDivOptions = function (data){
	var html = "";
	if(data.length > 0){
		//TODO: ubaciti ucitavanje - log slicicu
		data.forEach(function(obj, index, array){
			obj_name_underscore = obj.name.split(" ").join("_").toLowerCase();

			if(index % 4 === 0) {
					html += "<div class='form-group' ><div class='row' >";
					html += "<div class='col-sm-3'>";
					html += "<div class='checkbox'>" +
									"<label>" +
									"<input type='checkbox' name='advertisement[options_attributes][]' id='advertisement_options_" + obj_name_underscore + "' value='" + obj.id +"'/>" +
										obj.name +
									"</label>" +
									"</div>";
					html += "</div>";

			} else if(index % 4 === 3) {
					html += "<div class='col-sm-3'>";
					html += "<div class='checkbox'>" +
									"<label>" +
									"<input type='checkbox' name='advertisement[options_attributes][]' id='advertisement_options_" + obj_name_underscore + "' value='" + obj.id +"'/>" +
										obj.name +
									"</label>" +
									"</div>";
					html += "</div>";						
					html += "</div></div>";					

		  } else {
					html += "<div class='col-sm-3'>";
					html += "<div class='checkbox'>" +
									"<label>" +
									"<input type='checkbox' name='advertisement[options_attributes][]' id='advertisement_options_" + obj_name_underscore + "' value='" + obj.id +"'/>" +
										obj.name +
									"</label>" +
									"</div>";
					html += "</div>";
			}
		});
  }

  return html;
}

jQuery.ajaxSetup({
  beforeSend: function(xhr) {
    $('#spinner').show();
  },
  // runs after AJAX requests complete, successfully or not
  complete: function(xhr, status){
    $('#spinner').hide();
  }
});

var category_id = jQuery("#categories option:selected").val();
var error_explanation = jQuery('#error_explanation');

if(category_id === "" || category_id === undefined) {
	//jQuery("#show-form").hide();
	//jQuery("#form-message").show();

	jQuery("#show-form").invisible().hide();
	jQuery("#form-message").show();
} else {
	//jQuery("#form-message").hide();
	//jQuery("#show-form").show();
	console.log("Category ID is: " + category_id);

	jQuery("#show-form").visible().show();
	jQuery("#form-message").invisible().hide();
}

//=======START on categories change callback===================//
jQuery("#categories").on('change', function(){
	var category_id = jQuery("#categories option:selected").val();
	var vb_select = jQuery("#vehicle_brands");
	var vm_select = jQuery("#vm_select");
	var vehicle_brand_id = jQuery("#vehicle_brands option:selected").val();

	jQuery('#basic_informations').empty();
	jQuery('#additional_informations').empty();
	jQuery('#options').empty();

	// reset form validator
	validator.resetForm();

	if(category_id === ""){
		jQuery(".start-message").show();	
		jQuery("#show-form").invisible().hide();	
		jQuery('option', vb_select).remove();
		jQuery('option', vm_select).remove();
		
	} else {
		jQuery(".start-message").invisible().hide();	
		jQuery('option', vm_select).remove();

		//get all brands for this category
		jQuery.ajax({
  		type: 'GET',
  		url: '/vehicle_brands',
  		data: { id: category_id },
  		dataType: 'json',
		  statusCode: {
					404: function() {
  				console.log( "404: page not found" );
				}
			}

  	}).done(function(data){
  		jQuery('option', vb_select).remove();

  		if(data.length > 0){
  			vb_select.append("<option value>Select...</option>");
  			data.forEach(function(obj, index, array){
  				var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
        	vb_select.append(option);
  			});
  		}

  	}).fail(function(jqXHR, textStatus){
  		console.log("Request failed: " + textStatus);
  	});

  	//all basic information for this category
  	jQuery.ajax({
  		type: "GET",
  		url: "/categories/" + category_id + "/basic",
  		data: { id: category_id },
  		dataType: 'json',
  		async: false,
  		statusCode: {
  			404: function(){
  				console.log( "404: page not found" );
  			}
  		}
  	}).done(function(data){
			var html = "";
			var $divBasicInfo = jQuery("#basic_informations");

			if(data.length > 0){
				//TODO: ubaciti ucitavanje - log slicicu
				data.forEach(function(information, infoIndex, infoArray){
					// get items if exists
					jQuery.ajax({
						type: "GET",
			  		url: "/information/" + information.id + "/items",
			  		data: { id: information.id },
			  		dataType: 'json',
			  		async: false,
			  		statusCode: {
			  			404: function(){
			  				console.log( "404: page not found" );
			  			}
			  		}
					}).done(function(data){

						information_name_underscore = information.name.split(" ").join("_").toLowerCase();

						if(data.length > 0){
							// if items for this information exists
							if(infoIndex % 3 === 0){
									html += "<div class='form-group' ><div class='row' >";
									html += "<div class='col-sm-4'>";
									html += "<label>" + information.name +":</label><br />";
									html += "<select name='advertisement[advertisement_informations][" + information.id +"]' id='advertisement_advertisement_informations_" + information_name_underscore + "' >";
									html += "<option value=\"\">Select...</option>"
									data.forEach(function(obj, index, array){		
										html += "<option value=\"" + obj.name +"\">" + obj.name +"</option>"
									});
									html += "</select>";
									html += "</div>";
							} else if(infoIndex % 3 == 2) {
									html += "<div class='col-sm-4'>";
									html += "<label>" + information.name +":</label><br />";
									html += "<select name='advertisement[advertisement_informations][" + information.id +"]' id='advertisement_advertisement_informations_" + information_name_underscore +"' >";
									html += "<option value=\"\">Select...</option>"
									data.forEach(function(obj, index, array){		
										html += "<option value=\"" + obj.name +"\">" + obj.name +"</option>"
									});
									html += "</select>";
									html += "</div>";						
									html += "</div></div>";
							} else {
									html += "<div class='col-sm-4'>";
									html += "<label>" + information.name +":</label><br />";
									html += "<select name='advertisement[advertisement_informations][" + information.id +"]' id='advertisement_advertisement_informations_" + information_name_underscore +"' >";
									html += "<option value=\"\">Select...</option>"
									data.forEach(function(obj, index, array){		
										html += "<option value=\"" + obj.name +"\">" + obj.name +"</option>"
									});
									html += "</select>";
									html += "</div>";
							}
						
						} else {
							
							if(infoIndex % 3 === 0){
								html += "<div class='form-group'><div class='row'>";
								html += "<div class='col-sm-4'>";
								html += "<label>" + information.name +":</label><br />"
								html += "<input type='text' id='advertisement_advertisement_informations_" + information_name_underscore + "' name='advertisement[advertisement_informations][" + information.id + "]' placeholder='Enter...' />"
								html += "</div>";

							} else if(infoIndex % 3 === 2) {
								html += "<div class='col-sm-4'>";
								html += "<label>" + information.name +":</label><br />";
								html += "<input type='text' id='advertisement_advertisement_informations_" + information_name_underscore + "' name='advertisement[advertisement_informations][" + information.id + "]' placeholder='Enter...' />"
								html += "</div>";						
								html += "</div></div>";

							} else {
								html += "<div class='col-sm-4'>";
								html += "<label>" + information.name +":</label><br />";
								html += "<input type='text' id='advertisement_advertisement_informations_" + information_name_underscore + "' name='advertisement[advertisement_informations][" + information.id + "]' placeholder: 'Enter...' />"
								html += "</div>";
							}
						}


					}).fail(function(jqXHR, textStatus){
						console.log("Request failed: " + textStatus);
					});	

				});	

				$divBasicInfo.append(html);
			}	

  	}).fail(function(jqXHR, textStatus){
			console.log("Request failed: " + textStatus);
		});	

  	// get all additional options for this category
  	jQuery.ajax({
  		type: "GET",
  		url: "/categories/" + category_id + "/additional",
  		data: { id: category_id },
  		dataType: 'json',
  		async: false,
  		statusCode: {
  			404: function(){
  				console.log( "404: page not found" );
  			}
  		}
  	}).done(function(data){
			var html = "";
			var $divAdditionalInfo = jQuery("#additional_informations");

			if(data.length > 0){
				//TODO: ubaciti ucitavanje - log slicicu
				data.forEach(function(information, infoIndex, infoArray){
					// get items if exists
					jQuery.ajax({
						type: "GET",
			  		url: "/information/" + information.id + "/items",
			  		data: { id: information.id },
			  		dataType: 'json',
			  		async: false,
			  		statusCode: {
			  			404: function(){
			  				console.log( "404: page not found" );
			  			}
			  		}
					}).done(function(data){

						if(data.length > 0){
							// if items for this information exists
							if(infoIndex % 3 === 0){
									html += "<div class='form-group' ><div class='row' >";
									html += "<div class='col-sm-4'>";
									html += "<label>" + information.name +":</label><br />";
									html += "<select name='advertisement[advertisement_informations][" + information.id +"]' id='" + information.name.toLowerCase().replace(' ', '_') +"_id'>";
									html += "<option value=\"\">Select...</option>"
									data.forEach(function(obj, index, array){		
										html += "<option value=\"" + obj.id +"\">" + obj.name +"</option>"
									});
									html += "</select>";
									html += "</div>";
							} else if(infoIndex % 3 == 2) {
									html += "<div class='col-sm-4'>";
									html += "<label>" + information.name +":</label><br />";
									html += "<select name='advertisement[advertisement_informations][" + information.id +"]' id='" + information.name.toLowerCase().replace(' ', '_') +"_id'>";
									html += "<option value=\"\">Select...</option>"
									data.forEach(function(obj, index, array){		
										html += "<option value=\"" + obj.id +"\">" + obj.name +"</option>"
									});
									html += "</select>";
									html += "</div>";						
									html += "</div></div>";
							} else {
									html += "<div class='col-sm-4'>";
									html += "<label>" + information.name +":</label><br />";
									html += "<select name='advertisement[advertisement_informations][" + information.id +"]' id='" + information.name.toLowerCase().replace(' ', '_') + "_id'>";
									html += "<option value=\"\">Select...</option>"
									data.forEach(function(obj, index, array){		
										html += "<option value=\"" + obj.id +"\">" + obj.name +"</option>"
									});
									html += "</select>";
									html += "</div>";
							}
						
						} else {
							
							if(infoIndex % 3 === 0){
								html += "<div class='form-group' ><div class='row' >";
								html += "<div class='col-sm-4'>";
								html += "<label>" + information.name +":</label><br />"
								html += "<input type='text' id='advertisement_" + information.name.toLowerCase().replace(' ', '_') + "' name='advertisement[advertisement_informations][" + information.id +"]' placeholder: 'Enter...' />"
								html += "</div>";

							} else if(infoIndex % 3 === 2) {
								html += "<div class='col-sm-4'>";
								html += "<label>" + information.name +":</label><br />";
								html += "<input type='text' id='advertisement_" + information.name.toLowerCase().replace(' ', '_') + "' name='advertisement[advertisement_informations][" + information.id +"]' placeholder: 'Enter...' />"
								html += "</div>";						
								html += "</div></div>";

							} else {
								html += "<div class='col-sm-4'>";
								html += "<label>" + information.name +":</label><br />";
								html += "<input type='text' id='advertisement_" + information.name.toLowerCase() + "' name='advertisement[advertisement_informations][" + information.id +"]' placeholder: 'Enter...' />"
								html += "</div>";
							}
						}


					}).fail(function(jqXHR, textStatus){
						console.log("Request failed: " + textStatus);
					});	

				});	

				$divAdditionalInfo.append(html);

				// add rules for all basic information	
				jQuery("#basic_informations input[type=text], #basic_informations select").each(function(){
					console.log(this);
					jQuery(this).rules("add", {
						required: true, 
						messages: {required: "This field is required."}	
					});
				});
			}	

  	}).fail(function(jqXHR, textStatus){
			console.log("Request failed: " + textStatus);
		});


		//get all option for this category
		jQuery.ajax({
			type: 'GET',
			url: "/categories/" + category_id + "/options",
			data: { id: category_id },
			dataType: 'json',
		  statusCode: {
				404: function() {
					console.log( "404: page not found" );
				}
			}

		}).done(function(data){
			var $divOptions = jQuery("#options");
			var html = printDivOptions(data);
		  $divOptions.append(html);

		}).fail(function(jqXHR, textStatus){
			console.log("Request failed: " + textStatus);
		});	

		jQuery("#show-form").show();	
	}
});
//=======END on categories change callback===================//


//=======START on vb_select change callback===================//
jQuery("#vehicle_brands").on('change', function(){ 
	var vehicle_brand_id = jQuery("#vehicle_brands option:selected").val();
	var category_id = jQuery("#categories option:selected").val();
	var vm_select = jQuery("#vm_select");

	if(vehicle_brand_id !== ""){	    	
  	jQuery.ajax({
  		type: 'GET',
  		url: '/vehicle_models',
  		data: { id: vehicle_brand_id, category_id: category_id },
  		dataType: 'json',
		  statusCode: {
					404: function() {
  				console.log( "404: page not found" );
				}
			}

  	}).done(function(data){
  		//enable select
  		if(vm_select.attr("disabled")){
  			vm_select.removeAttr("disabled");
  		}

  		jQuery('option', vm_select).remove();

  		if(data.length > 0){
  			vm_select.append("<option>Select...</option>");
  			data.forEach(function(obj, index, array){
  				var option = '<option value="'+obj.id+'">'+obj.name+'</option>';
        	vm_select.append(option);
  			});
  	  }

  	  // add rule for validation
			jQuery("#basic_informations #vm_select").each(function(){
				console.log(this);
				jQuery(this).rules("add", {
					required: true, 
					messages: {required: "Please select a vehicle model."}	
				});
			});

  	}).fail(function(jqXHR, textStatus){
  		$( vm_select ).rules( "remove" );
  		console.log("Request failed: " + textStatus);
  	});
  
  } else {
  	jQuery('option', vm_select).remove();
  	//jQuery('#option').remove();
  	vm_select.attr("disabled", "disabled");

  	//remove validation rule
  	$(vm_select).rules( "remove" );
  }
})
//=======END on vb_select change callback===================//






