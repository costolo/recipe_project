get '/recipes' do
  @recipes = Recipe.all
  erb :'/recipes/index'
end

get '/recipes/new' do
  erb :'/recipes/new'
end

get '/recipes/:id' do |id|
  @recipe = Recipe.find(id)
  @comments = @recipe.comments
  erb :'/recipes/show'
end

post '/recipes' do
  recipe = Recipe.create(params[:recipe])
  redirect "/recipes/#{recipe.id}"
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

def show_recipe
  respond_to do |format|
    format.js
  end
end
