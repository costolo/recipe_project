get '/signin' do
  erb :'auth/signin'
end

post '/signin' do
  unconfirmed_user = User.find_by(name: params[:name])

  if unconfirmed_user
    user = unconfirmed_user.authenticate(params[:password])
    if user
      session_in!(user)
    else
      bounce_with_error_msg! "Incorrect Password"
    end
  else
    bounce_with_error_msg! "Incorrect Username"
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  unless name_unique?(params[:name])
    set_error! "Username already exists."
    redirect '/signup'
  end

  set_error_if_invalid!(params[:name], params[:password])
  user = User.create(name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])

  if user.id && account_valid?(params[:name], params[:password])
    session_in!(user)
  else
    set_error! "Passwords do not match." if password_valid?(params[:password])
    redirect '/signup'
  end
end

get '/signout' do
  session_out!

  redirect '/'
end
