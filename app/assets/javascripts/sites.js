$(document).ready(function(){


	$('#autoLocateCb').change(function(){
		if($(this).is(":checked")) {
			$('#siteLoc').hide();
		} else{
			$('#siteLoc').show();
		}
	});

});