jQuery(document).ready(function($) {
	/** TOGGLE ACTIONS */
	$("a#login_activator").click(function(event){
		$("div#login_form").toggle();
	});
	
	$("a#change_pw_area_trigger").click(function(event){
		$("div#change_pw_area").toggle();
	});
	
	$("#error_explanation,#notice").click(function(event){
		$("#error_explanation,#notice").toggle("slow");
	});

});