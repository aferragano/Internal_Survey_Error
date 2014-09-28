def invalid_session? #checks to see whether session is not nil 
  session[:id] == nil 
end

def print_nicely(input)
  puts "-" * 30
  puts input 
  puts "-" * 30
end
    