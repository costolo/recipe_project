$('.add_comment').submit(function(event) {
	event.preventDefault();
	var $target = $(event.target);
	console.log($target.attr("action"));
	$.ajax({
		url: $target.attr("action"),
		type: 'POST',
		data: $target.serialize()
	}).done(function(response){
		$(".col-md-6").html(response);
	});
});
