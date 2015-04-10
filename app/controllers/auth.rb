get '/signin' do
  erb :'auth/signin'
end

post '/signin' do
  unconfirmed_user = User.find_by(name: params[:name])

  if unconfirmed_user
    user = unconfirmed_user.authenticate(params[:password])
    if user
      session_in!(user)
      redirect '/authenticated'
    else
      redirect '/signin'
    end
  else
    redirect '/signin'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])
  if user.id
    session_in!(user)
    redirect '/'
  else
    redirect '/signup'
  end
end

get '/signout' do
  session_out!
  redirect '/'
end

get '/authenticated' do
  if session[:user_id]
    erb :'auth/authenticated'
  else
    redirect '/signin'
  end
end
