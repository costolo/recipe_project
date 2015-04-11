def session_in!(user)
  session[:user_id] = user.id
  redirect "/"
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

def set_error_if_invalid!(name, password)
  unless name_valid?(name)
    flash[:name_error] = "Username (required) must be between 4 and 15 letters (inclusive) and only allow _ or -."
  end
  unless password_valid?(password)
    flash[:password_error] = "Password (required) must be between 4 and 15 letters (inclusive)."
  end
end

def account_valid?(name, password)
  name_valid?(name) && password_valid?(password)
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

def passwords_match?(pw, conf_pw)
  pw == conf_pw
end

def name_unique?(name)
  User.where(name: name).count == 0
end

def bounce_with_error_msg!(msg)
  set_error! msg
  redirect '/signin'
end

