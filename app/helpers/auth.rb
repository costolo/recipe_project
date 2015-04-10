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

def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def validate_account(name, password)
  name_valid?(name) && password_valid?(password)
end

def name_valid?(name)
  valid_chars = ("A".."Z").to_a + ("a".."z").to_a + ["-","_"]
  name.length.between?(5,16) && name.split('').all? {|i| valid_chars.include?(i)}
end

def password_valid?(password)

end
