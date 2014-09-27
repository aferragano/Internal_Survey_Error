$( document ).ready(function() {

    $.colorbox({closeButton: false, width: '250', height:'250px', html:'<div class="login"><center><form action="/login" method="POST"><p><br>LOGIN</p><br><input type="text" name="email" placeholder="email"><br><br><input type="password" name="password" placeholder="password"><br><br><input class="btn btn-primary" type="submit" name="Login"></form></center></div>'});

    $(".login").submit(function(event){
    	event.preventDefault();
    	$.colorbox.close();
    });

});
