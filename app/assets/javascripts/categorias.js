$(window).scroll(function() {    
    var scroll = $(window).scrollTop();
    if (scroll >= 1) {
        $(".header-web").addClass("follower");
        $(".follower").css("background-color", "rgba(0,0,0,0.5)");
    }else{
        $(".header-web").removeClass("follower");
        $(".header-web").css("background-color", "#11110e");
    }
});

