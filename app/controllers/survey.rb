# survey.rb
# survey create get post update diplay?


get '/create' do
	erb :'/create'
end

post '/create/' do
  @user = User.find(session[:user_id])
  p params
	@survey = @user.surveys.create(title: params[:title])
	# @question = @survey.questions.create(question: params[:question])
	# @question.options.create(option: params[:option1])
 #  @question.options.create(option: params[:option2])
 #  @question.options.create(option: params[:option3])
 #  @question.options.create(option: params[:option4])
# THIS IS COMMENTED OUT FOR TESTING SPLITING SURVERY TITLE AND QUESTION
#   @question = Survey.last.questions.create(question: params[:question])
#   @question.options.create(option: params[:option1])
#   @question.options.create(option: params[:option2])
#   @question.options.create(option: params[:option3])
#   @question.options.create(option: params[:option4])

  # redirect '/create'
end

# This shit broke errything. revisit later.
# post '/question/new' do
# 	# # @question = @survey.questions.create(question: params[:question])
#  #  @survey.questions.last.option.create(option: params[:option1])
#  #  @question<< Option.create(option: params[:option1])
#  #  @question<< Option.create(option: params[:option2])
#  #  @question<< Option.create(option: params[:option3])
#  #  @question<< Option.create(option: params[:option4])
#   redirect :'/'
# end
post '/create/question' do

  @question = Survey.last.questions.create(question: params[:question])
  @question.options.create(option: params[:option1])
  @question.options.create(option: params[:option2])
  @question.options.create(option: params[:option3])
  @question.options.create(option: params[:option4])
  response = erb :'_question',
      :layout => false
  # redirect '/'
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])

  erb :'/take'
end

post '/survey/:id' do
  @user = User.find(session[:user_id])
p params
  answers = params.values[0..-5]
  p params
  p answers
  answers.each do |ans|
    @user.responses.create(:option_id => ans.to_i)
  end
  redirect '/'
end
