def session_in!(user)
  session[:user_id] = user.id
end

def session_out!
  session[:user_id] = nil
end
