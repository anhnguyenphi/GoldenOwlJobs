$(function() {
	// Load more
	var page = 1;
	var url = "load_more_jobs"
	$("a#loadMore").click(function() {
		page += 1;
	  $("a#loadMore").html("Page is loading...");
	  $.ajax({
	  	type: "GET",
	  	url: 'load_more_jobs',
	  	data: {
	  		page: page
	  	},
	  	success: function(result) {
	  		$("#jobs").append(result);
	  		$("a#loadMore").html("Show More");
	  	}
	  });
	});
	// clicked negotiable checkbox of job's form
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

	$("#job_cities").select2()

	$("#job_categories_search").select2()
})


