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

def name_valid?(name)
  valid_chars = ("A".."Z").to_a + ("a".."z").to_a + ["-","_"]

  if name.length.between?(4,15) && name.split('').all? {|i| valid_chars.include?(i)}
    true
  else
    false
  end
end

def password_valid?(password)
  valid_chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a

  if password.length.between?(4,10) && password.split('').all? {|i| valid_chars.include?(i)}
    true
  else
    false
  end
end