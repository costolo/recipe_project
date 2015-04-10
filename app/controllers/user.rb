get '/users/new' do

end


get '/users/:id' do |id|
  @user = User.find(id)
end
