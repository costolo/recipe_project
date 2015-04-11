post '/comments' do
	if request.xhr?
	  comment = Comment.create(params[:comment])
	  redirect "/recipes/#{comment.recipe_id}"
	end
end
