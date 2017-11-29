$(document).on('turbolinks:load',function(){

	$('#manualLookup').submit(function(e){
		$('#manualLookupStatus').empty();
		$('#manualLookupStatus').removeClass();
		show_spinner();
	});
});

	function hide_spinner(){
		$('#spinner').hide();
	}


	function show_spinner(){
		$('#spinner').show();
	}