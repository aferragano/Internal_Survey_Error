
get '/' do 
  @surveys = Survey.all();
  # binding.pry
  erb :home
end

