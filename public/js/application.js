$(document).ready(function() {
	$('.recipe_link').click(function(event) {
		event.preventDefault();
		var $target = $(event.target);
		console.log($target.attr("href"))
		$.ajax({
			url: $target.attr("href"),
			type: 'GET'
		}).done(function(response){
			$(".col-md-6").html(response);
		});
	});
});
