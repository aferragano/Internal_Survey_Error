
get '/' do 
  @surveys = Survey.all();
  erb :home
end

