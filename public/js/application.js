$( document ).ready(function() {
    invalidSession();
});


function checkLogin(){
    $.colorbox({opacity: '.3', closeButton: false, width: '250', height:'250px', html:'<div class="login"><center><form action="/login" method="POST"><p><br>LOGIN</p><br><input type="text" name="email" placeholder="email"><br><br><input type="password" name="password" placeholder="password"><br><br><input class="btn btn-primary" type="submit" name="Login"></form></center></div>'});
    $(".login form").submit(function(event){
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "/login",
            data: $(this).serialize()
        }).done(function(data){
            if (data == "true") {
                $.colorbox.close();
                $( "#block-screen" ).fadeOut( "slow");
                $(".navbar-right").append('<li><a id="logout-btn" href="/logout">Logout</a></li>');
                $(".list-group-item").css('z-index', 0);
            } else{
                $.extend(true, $.simplyToast.defaultOptions,
                    {
                       align: 'center',
                       offset:
                        {
                           from: "top",
                           amount: 300
                        }
                    });
                $.simplyToast("Incorrect Credentials", 'danger');
            }
        });
    });
}

function invalidSession() {
    $.ajax({
        type: "GET",
        url: "/invalid-session"
    }).success(function(response){
        // console.log(response);
        if (JSON.parse(response)) {
            $( "#block-screen" ).show();
            checkLogin();
        } else {
           $( "#block-screen" ).fadeOut( "slow");  
           $(".list-group-item").css('z-index', 0);
        }
    });
}