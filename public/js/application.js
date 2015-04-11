$(document).ready(function() {
	$('.recipe_link').click(function(event) {
		event.preventDefault();
		var $target = $(event.target);
		console.log($target.attr("href"))
		//$get.($target.attr("href"))
	})
});
