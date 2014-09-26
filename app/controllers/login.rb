get 'login' do 
	erb :'login'
end

post 'login' do 
	user = User.authenticate(params[:user])
	unless user.nil?
		session[:user_id] = user.id 
		redirect :index
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
	redirect :index
end
