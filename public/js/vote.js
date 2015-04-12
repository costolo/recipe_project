$('.vote_action').submit(function(event) {
	event.preventDefault();
	var $target = $(event.target);
	console.log($target.attr("action"))
	$.ajax({
		url: $target.attr("action"),
		type: 'GET'
	}).done(function(response){
		console.log(response)
		$("#vote-div").html(response);
	});
});
