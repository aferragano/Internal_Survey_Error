get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :take_survey
end  

post '/survey/:id' do
  @user = User.find(session[:user_id])
  answers = params.values[0..-5]
  p answers
  answers.each do |ans|
    @user.responses.create(:option_id => ans.to_i)
  end
  redirect '/'
end