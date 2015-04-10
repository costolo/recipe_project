post '/comments' do
  comment = Comment.create(params[:comment])
  redirect "/recipes/#{comment.recipe_id}"
end
