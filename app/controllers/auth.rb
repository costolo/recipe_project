get '/signin' do
  erb :'auth/signin'
end

post '/signin' do

end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])
  if user.id
    session[:user_id] == user_id
  else
    redirect '/signup'
  end
end

get '/signout' do
end
