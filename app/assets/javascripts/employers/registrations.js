$("#add_new_image").click(function() {
	var num = $(".image_upload").size();
	var new_input = $(".image_upload").last().clone().attr("class", "image_upload");
	new_input.children("input").attr("name", "employer[images_attributes][" + num + "][file]")
														 .attr("id", "employer_images_attributes_" + num + "_file");
	$("#images_upload").append(new_input);
});