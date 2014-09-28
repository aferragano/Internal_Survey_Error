# index.rb
get '/' do
  @survey = Survey.all.reverse
  # @option = Option.last
  erb :index
end
