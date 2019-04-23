$(window).scroll(function() {    
    var scroll = $(window).scrollTop();
    if (scroll >= 1) {
        $(".header-web").addClass("follower");
    }else{
        $(".header-web").removeClass("follower");
    }
});

