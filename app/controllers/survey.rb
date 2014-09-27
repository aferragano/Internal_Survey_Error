# survey.rb
# survey create get post update diplay?


get '/create' do
	erb :'/create'
end

post '/create/' do
  @user = User.find(session[:user_id])
	@survey = @user.surveys.create(title: params[:title])
	# @question = @survey.questions.create(question: params[:question])
	# @question.options.create(option: params[:option1])
 #  @question.options.create(option: params[:option2])
 #  @question.options.create(option: params[:option3])
 #  @question.options.create(option: params[:option4])

  @question = Survey.last.questions.create(question: params[:question])
  @question.options.create(option: params[:option1])
  @question.options.create(option: params[:option2])
  @question.options.create(option: params[:option3])
  @question.options.create(option: params[:option4])
  redirect '/'
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


get '/take' do
  @survey = Survey.last

  erb :'/take'
end
