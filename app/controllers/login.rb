
get '/login' do 
	user = User.authenticate(params[:user])
	unless user.nil?
		session[:user_id] = user.id 
		redirect '/'
	end 
	redirect 'login'
end

get '/logout' do 
	session.clear
	redirect '/'
end

post '/signup' do 
	user = User.create(params[:user])
	session[:user_id] =user.id
	redirect '/'
end
