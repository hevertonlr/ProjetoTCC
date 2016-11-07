/*FLEXSLIDER*/
$(window).load(function () {
    $('.listaitensGaleria').flexslider({
        animation: "slide",
        animationLoop: false,
        controlNav: false,
        slideshow: false,
        mousewheel: true,
        prevText: "",
        nextText: "",
        move: 1,
        itemWidth: 206,
        itemMargin: 19,
        pausePlay: false
    });
    $('.listapublic1').flexslider({
        animation: "fade",
        animationLoop: true,
        controlNav: false,
        slideshow: true,
        directionNav: false,
        mousewheel: false,
        prevText: "",
        nextText: "",
        move: 1,
        itemWidth: 300,
        itemMargin: 0,
        pausePlay: false
    });
    $('.listapublic2').flexslider({
        animation: "fade",
        animationLoop: true,
        controlNav: false,
        slideshow: true,
        directionNav: false,
        mousewheel: false,
        prevText: "",
        nextText: "",
        move: 1,
        itemWidth: 300,
        itemMargin: 0,
        pausePlay: false
    });
});
/*CUSTOM SCROLLBAR*/
$(window).load(function () {
    $(".ntList").mCustomScrollbar({
        scrollInertia: 600
    });
    $(".vdlist").mCustomScrollbar({
        scrollInertia: 600
    });
});
