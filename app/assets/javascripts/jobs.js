$("#negotiable").change(function() {
	if (this.checked) {
		$("#salary_container").show();
	} else {
		$("#salary_container").hide();
	}
})

$("#job_categories").select2({
  tags: true
})
