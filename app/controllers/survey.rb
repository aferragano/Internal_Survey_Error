# survey.rb
# survey create get post update diplay?


get '/survey/create' do
	erb :'/create_survey'
end


post '/survey/create/' do
	@survey = Survey.create(title: params[:survey])
	# question = @survey.questions.create(question: params[:question])
	option = question.options.create(option: params[:option])
end

post '/question/new' do
	question = @survey.questions.create(question: params[:question])
end