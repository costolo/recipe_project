def session_in!
end

def session_out!
  session[:user_id] = nil
end