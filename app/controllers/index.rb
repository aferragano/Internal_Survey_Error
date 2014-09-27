# index.rb
get '/' do
  @survey = Survey.all
  # @option = Option.last
  erb :index
end
