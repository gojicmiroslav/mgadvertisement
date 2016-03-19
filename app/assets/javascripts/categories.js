$(function(){


	$("#search_vehicle_brand").on('change', function(){
		var vehicle_brand_id = $('#search_vehicle_brand option:selected').val();
		var $search_vehicle_model = $('#search_vehicle_model');

		if(vehicle_brand_id === ""){
			$search_vehicle_model.prop('disabled', 'disabled');
			$('option', $search_vehicle_model).remove();
		} else {
			$('option', $search_vehicle_model).remove();
			// populate search_vehicle_model
			jQuery.ajax({
				type: 'GET',
				url: '/vehicle_brands/' + vehicle_brand_id,
				data: {},
				dataType: 'json',
				statusCode: {
						404: function() {
	  				console.log( "404: page not found" );
					}
				}
			}).done(function(data){
				
				if(data.length > 0) {
					$search_vehicle_model.prop('disabled', false);
					data.forEach(function(obj, index, array){
						var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
						$search_vehicle_model.append(option);
					});
				}

			});
		}

	});

});


