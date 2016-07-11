var check_file_extension = function() {
	var ext = $('#job_application_employee_resume').val().split('.')
																								.pop().toLowerCase();
	if($.inArray(ext, ['pdf','doc','docx']) != -1) {
	    return true;
	}
	return false;
}

// Check input new resume
$("#job_application_employee_resume").change(function() {
	if ($("#job_application_employee_resume").val()) {
		if (check_file_extension()) {
			$("#resume_input_valid").show();
			$("#resume_input_invalid").hide();
		} else {
			$("#resume_input_valid").hide();
			$("#resume_input_invalid").show();
		}
	} else {
		$("#resume_input_invalid").hide();
		$("#resume_input_valid").hide();
	}
});
// check form submit
$("#new_job_application").submit(function() {
	if ($('#resume_new').is(':checked')) {
		if(check_file_extension()) {
			return true;
		}
		alert('Your CV extension is invalid');
		return false;
	}
	return true;
});
