# survey.rb
# survey create get post update diplay?


get '/create' do
	erb :'/create'
end

post '/create/' do
	@survey = Survey.create(title: params[:survey])
	# question = @survey.questions.create(question: params[:question])
	# option = question.options.create(option: params[:option])
end

post '/question/new' do
	question = @survey.questions.create(question: params[:question])
end


get '/take' do
  erb :'/take'
end
