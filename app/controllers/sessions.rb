get '/login-form' do
  response = erb :'_login-form', :layout => false
  return response.to_json
end

post '/login' do # Tested and works properly 
   
  user = User.find_by(email: params[:email])

  if user == nil
    return false.to_json
  end

  valid = user.authenticate(params[:password])
  
  if valid == false
    return false.to_json
  else
    session[:id] = valid.id
    puts "I'm a boss"
    return true.to_json
  end

end