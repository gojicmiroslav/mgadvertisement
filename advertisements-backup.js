
jQuery( "#advertisement_year" ).datepicker({
  showOn: "button",
  buttonImage: "/images/calendar.gif",
  buttonImageOnly: true,
  buttonText: "Select date",
  dateFormat: "yy-mm-dd"
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
			if(index % 4 === 0) {
					html += "<div class='form-group' ><div class='row' >";
					html += "<div class='col-sm-3'>";
					html += "<div class='checkbox'>" +
									"<label>" +
									"<input type='checkbox' name='" + obj.name + "' id='" + obj.id + "' value='" + obj.name +"'/>" +
										obj.name +
									"</label>" +
									"</div>";
					html += "</div>";

			} else if(index % 4 === 3) {
					html += "<div class='col-sm-3'>";
					html += "<div class='checkbox'>" +
									"<label>" +
									"<input type='checkbox' name='" + obj.name + "' id='" + obj.id + "' value='" + obj.name +"'/>" +
										obj.name +
									"</label>" +
									"</div>";
					html += "</div>";						
					html += "</div></div>";					

		  } else {
					html += "<div class='col-sm-3'>";
					html += "<div class='checkbox'>" +
									"<label>" +
									"<input type='checkbox' name='" + obj.name + "' id='" + obj.id + "' value='" + obj.name +"'/>" +
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

if(category_id === "") {
	//jQuery("#show-form").hide();
	//jQuery("#form-message").show();

	jQuery("#show-form").invisible().hide();
	jQuery("#form-message").show();
} else {
	//jQuery("#form-message").hide();
	//jQuery("#show-form").show();

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
	jQuery('#options').empty();

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
  			vb_select.append("<option>Select...</option>");
  			data.forEach(function(obj, index, array){
  				var option = '<option value="'+obj.id+'">'+obj.name+'</option>';
        	vb_select.append(option);
  			});
  		}

  	}).fail(function(jqXHR, textStatus){
  		console.log("Request failed: " + textStatus);
  	});


  	//all basic information for this category
  	var $divBasicInfo = jQuery("#basic_informations");
  	var divHtml = "";
  	var promiseHtml = jQuery.Deferred();
  	promiseHtml.then(function(promiseHtml){
  		$divBasicInfo.append(promiseHtml);
  		console.log("Promise HTML: " + promiseHtml);
  	});
		
  	jQuery.when(jQuery.ajax({
		  		type: "GET",
		  		url: "/categories/" + category_id + "/basic",
		  		data: { id: category_id },
		  		dataType: 'json',
		  		statusCode: {
		  			404: function(){
		  				console.log( "404: page not found" );
		  			}
		  		}
				})
	  ).then(function(basic_informations){

	  	//jQuery.when.apply(jQuery, basic_informations).then();	

	  	basic_informations.forEach(function(info, index){
				jQuery.when(jQuery.ajax({
							type: "GET",
				  		url: "/information/" + info.id + "/items",
				  		data: { id: info.id },
				  		dataType: 'json',
				  		statusCode: {
				  			404: function(){
				  				console.log( "404: page not found" );
				  			}
				  		}
						})
				).then(function(items){
					  //var html = "";
						if(items.length > 0) {
								// if items for this information exists
								if(index % 3 === 0){
										html += "<div class='form-group' ><div class='row' >";
										html += "<div class='col-sm-4'>";
										html += "<label>" + info.name +":</label><br />";
										html += "<select name='" + info.name +"' id='" + info.name +"_id'>";
										html += "<option value=\"\">Select...</option>"
										items.forEach(function(obj, i, arr){		
											html += "<option value=\"" + obj.id +"\">" + obj.name +"</option>"
										});
										html += "</select>";
										html += "</div>";
								} else if(infoIndex % 3 == 2) {
										html += "<div class='col-sm-4'>";
										html += "<label>" + info.name +":</label><br />";
										html += "<select name='" + info.name +"' id='" + info.name +"_id'>";
										html += "<option value=\"\">Select...</option>"
										items.forEach(function(obj, i, arr){		
											html += "<option value=\"" + obj.id +"\">" + obj.name +"</option>"
										});
										html += "</select>";
										html += "</div>";						
										html += "</div></div>";
								} else {
										html += "<div class='col-sm-4'>";
										html += "<label>" + info.name +":</label><br />";
										html += "<select name='" + info.name +"' id='" + info.name +"_id'>";
										html += "<option value=\"\">Select...</option>"
										items.forEach(function(obj, i, arr){		
											html += "<option value=\"" + info.id +"\">" + info.name +"</option>"
										});
										html += "</select>";
										html += "</div>";
								}

						} else { // data.length < 0
								if(index % 3 === 0){
										html += "<div class='form-group' ><div class='row' >";
										html += "<div class='col-sm-4'>";
										html += "<label>" + info.name +":</label><br />"
										html += "<input type='text' id='" + info.name + "_" + info.id + "' name='" + info.name + "' placeholder: 'Enter...' />";
										html += "</div>";

								} else if(index % 3 === 2) {
										html += "<div class='col-sm-4'>";
										html += "<label>" + info.name +":</label><br />";
										html += "<input type='text' id='" + info.name + "_" + info.id + "' name='" + info.name + "' placeholder: 'Enter...' />";
										html += "</div>";						
										html += "</div></div>";

								} else {
										html += "<div class='col-sm-4'>";
										html += "<label>" + info.name +":</label><br />";
										html += "<input type='text' id='" + info.name + "_" + info.id + "' name='" + info.name + "' placeholder: 'Enter...' />";
										html += "</div>";
								}
						}

				}).fail(function(jqXHR, textStatus){
			  		$divBasicInfo.append("<p>Error has occured. Please try reload a page. Thank you!<p>");
						console.log("Request failed: " + textStatus);
				});

	  	}); // basic_information -forEach
			
			
			
  	}).fail(function(jqXHR, textStatus){
  		$divBasicInfo.append("<p>Error has occured. Please try reload a page. Thank you!<p>");
			console.log("Request failed: " + textStatus);
		});


  	// get all additional options for this category

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

  	}).fail(function(jqXHR, textStatus){
  		console.log("Request failed: " + textStatus);
  	});
  
  } else {
  	jQuery('option', vm_select).remove();
  	//jQuery('#option').remove();
  	vm_select.attr("disabled", "disabled");
  }
})
//=======END on vb_select change callback===================//
