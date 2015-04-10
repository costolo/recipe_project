def session_in!(user)
  session[:user_id] = user.id
end

def session_out!
  session[:user_id] = nil
end

def set_error!(msg)
  flash[:notice] = msg
end

def get_error
  flash[:notice] if flash[:notice]
end
