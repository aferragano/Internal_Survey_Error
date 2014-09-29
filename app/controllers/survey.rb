get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :take_survey
end  

post '/survey/:id' do
  @user = User.find(session[:id])
  p params
  answers = params.values[0..-5]
  p params
  p answers
  answers.each do |ans|
    @user.responses.create(:option_id => ans.to_i)
  end
  redirect '/'
end

get '/create' do 
  erb :'/create'
end

post '/create/' do 
  @user = User.find(session[:id])
  @survey = @user.surveys.create(title: params[:title])
end
