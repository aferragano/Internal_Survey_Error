def invalid_session? #checks to see whether session is not nil 
  session[:id] == nil 
end
