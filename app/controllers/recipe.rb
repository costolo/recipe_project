get '/recipes' do
  @recipes = Recipe.all.order("vote_count DESC")
  erb :'/recipes/index'
end

get '/recipes/new' do
  erb :'/recipes/new'
end

get '/recipes/:id' do |id|
  if request.xhr?
    @recipe = Recipe.find(id)
    @comments = @recipe.comments
    erb :'/recipes/show'
  end
end

post '/recipes' do
  recipe = Recipe.create(params[:recipe])
  redirect "/recipes"
end

put '/recipes/:id' do |id|
  recipe = Recipe.find(id)
  recipe.update(params[:recipe])
  redirect "/recipes/#{recipe.id}"
end

get '/recipes/:id/edit' do |id|
  @recipe = Recipe.find(id)
  erb :'recipes/edit'
end

get '/recipes/:id/upvotes' do |id|
  if request.xhr?
    @recipe = Recipe.find(id)
    if !vote_exists?(current_user, @recipe)
      Vote.create(recipe_id: @recipe.id, user_id: current_user.id)
      @recipe.upvote
      erb :'votes/_vote'
    else
      set_error!("You may only vote once idiot.")
      erb :'votes/_vote'
    end
  end
end

get '/recipes/:id/downvotes' do |id|
  if request.xhr?
    @recipe = Recipe.find(id)
    if !vote_exists?(current_user, @recipe)
      Vote.create(recipe_id: @recipe.id, user_id: current_user.id)
      @recipe.downvote
      erb :'votes/_vote'
    else
      set_error!("You may only vote once idiot.")
      erb :'votes/_vote'
    end
  end
end
