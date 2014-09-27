get '/login-form' do
  response = erb :'_login-form', :layout => false
  return response.to_json
end

post '/login' do # Tested and works properly 
   
  user = User.find_by(email: params[:email])

  if user == nil
    redirect '/home'
  end

  valid = user.authenticate(params[:password])
  
  if valid == false
    redirect '/home'
  else
    session[:id] = valid.id
    puts "I'm a boss"
    erb :another_place
  end

end