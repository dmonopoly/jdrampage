jQuery(document).ready(function($) {
	/** TOGGLE ACTIONS */
	$("a#login_activator").click(function(event){
		$("div#login_form").toggle();
	});
	
	$("#error_explanation,#notice,.field_with_errors").click(function(event){
		$("#error_explanation,#notice,.field_with_errors").toggle("slow");
	});

});