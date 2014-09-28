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

get '/invalid-session' do #return true/false based on whether or not there is a current session
  return invalid_session?.to_json
end

get '/logout' do 
  session[:id] = nil
  redirect to '/'
end