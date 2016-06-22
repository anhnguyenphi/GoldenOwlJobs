	$("#negotiable").change(function() {
		if (this.checked) {
			$("#salary_container").show();
		} else {
			$("#salary_container").hide();
		}
	})