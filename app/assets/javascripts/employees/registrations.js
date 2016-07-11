var check_file_extension_employee = function() {
	var ext = $('#employee_resume').val().split('.')
																	.pop().toLowerCase();
	if($.inArray(ext, ['pdf','doc','docx']) != -1) {
	    return true;
	}
	return false;
}
// Check input resume
$("#employee_resume").change(function() {
	if ($("#employee_resume").val()) {
		if (!check_file_extension_employee()) {
			$("#resume_input_valid").hide();
			$("#resume_input_invalid").show();
		} else {
			$("#resume_input_valid").show();
			$("#resume_input_invalid").hide();
		}
	} else {
		$("#resume_input_invalid").hide();
		$("#resume_input_valid").hide();
	}
});
// check submit form
$("#edit_employee").submit(function() {
	if ($("#employee_resume").val()) {
		if(check_file_extension_employee()) {
			return true;
		}
		alert('Your CV extension is invalid');
		return false;
	}
	return true;
});

$("#employee_city").select2();
