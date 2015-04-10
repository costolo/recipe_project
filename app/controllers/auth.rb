get '/signin' do
  erb :'auth/signin'
end

post '/signin' do
  unconfirmed_user = User.find_by(name: params[:name])

  if unconfirmed_user
    user = unconfirmed_user.authenticate(params[:password])
    if user
      session_in!(user)
      redirect '/recipes'
    else
      set_error! "Incorrect Password"
      redirect '/signin'
    end
  else
    set_error! "Incorrect Username"
    redirect '/signin'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  set_error_if_invalid!(params[:user][:name], params[:user][:password])

  user = User.create(params[:user])

  if user.id && account_valid?(user.name, params[:user][:password])
    session_in!(user)
    redirect '/'
  else
    set_error! "Passwords do not match." if password_valid?(params[:user][:password])
    redirect '/signup'
  end
end

get '/signout' do
  session_out!

  redirect '/'
end
