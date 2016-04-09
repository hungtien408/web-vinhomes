(function ($) {
    function pageLoad() {

    }
    $(window).load(function () {
        // slider content
        var numslide = $('.slick-slider .slide').size();
        var bool = true;
        if (numslide < 4) {
            $('.slick-slider .slide').clone().appendTo($('.slick-slider'));
            bool = false;
        }
        $('.slick-slider').slick({
            arrows: bool,
            centerMode: true,
            //            centerPadding: '40px',
            slidesToShow: 3,
            autoplay: true,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: bool,
                        centerMode: true,
                        centerPadding: '20px',
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: bool,
                        centerMode: true,
                        centerPadding: '20px',
                        slidesToShow: 1
                    }
                }]
            });
            //banner
            if ($("#bannerSlider").size() == 1) {
                bannerbox();
                $(window).resize(function () {
                    bannerbox();
                });
                $("#bannerSlider .banner-img").each(function () {
                    var srcimg = $(this).attr("rel-src");
                    $(this).backstretch(srcimg);
                });
                $("#wrapper").append('<div id="banner-control"><span class="slider-prev control-b"></span><span class="slider-next control-b"></span></div>');
                var banner = $('#bannerSlider').bxSlider({
                    mode: 'fade',
                    pager: false,
                    auto: true
                });
                $("#banner-control .control-b").click(function () {
                    banner.startAuto();
                });
            }
        });
        //function banner
        function bannerbox() {
            var hwin = $(window).height();
            var wwin = $(window).width();
            if (wwin > 979) {
                $("#bannerSlider .banner-img").css({ "height": hwin, "width": wwin });
            } else if (wwin > 768 && wwin < 980) {
                $("#bannerSlider .banner-img").css({ "height": hwin, "width": wwin });
            } else {
                $("#bannerSlider .banner-img").css({ "height": hwin, "width": wwin });
            }
        }
    $(function () {
        $("#menuContent").mouseleave(function () {
            $(".panel-left").removeClass("current");
            $("#menuContent").delay(3000).fadeOut();
        });
        if ($("#bannerBg").size() == 1) {
            var imgsrc = $("#bannerBg").attr("rel-src");
            $.backstretch(imgsrc);
            var textie = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + imgsrc + "',sizingMethod='scale')";
            var textie2 = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + imgsrc + "',sizingMethod='scale')";
            $("body").css({ "background-image": "url(" + imgsrc + ")", "filter": textie, "-ms-filter": textie2 });
        }
        mymenudes();
        menusroll();
        $("#sroltop a").click(function () {
            $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
            return false;
        });
        $(".login-link").click(function () {
            $(this).toggleClass("current");
            var idlogin = $(this).attr("href");
            if ($(this).hasClass("current")) {
                $(idlogin).slideDown();
            } else {
                $(idlogin).slideUp();
            }
//            $("#login").mouseleave(function () {
//                $(".login-link").removeClass("current");
//                $("#login").fadeOut();
//            });
            return false;
        });
        function runEffect() {
            // get effect type from
            var selectedEffect = $("#effectTypes").val();

            // most effect types need no options passed by default
            var options = {};
            // some effects have required parameters
            if (selectedEffect === "scale") {
                options = { percent: 0 };
            } else if (selectedEffect === "size") {
                options = { to: { width: 200, height: 60} };
            }

            // run the effect
            $("#effect").toggle(selectedEffect, options, 500);
        };

        // set effect from select menu value
        $("#button").click(function () {
            runEffect();
        });
        $('.listAside').textHeight({
            activetit: true,
            listcss: [{ cssname: ".box-name"}],
            wpointb: false,
            widthpont: 420,
            desbool: true,
            listpos: [{ cssnamepos: ".box-name a", cssheightnum: "1"}],
            max: true
        });
        $('.project-tb').textHeight({
            activetit: true,
            listcss: [{ cssname: ".project-img" }, { cssname: ".project-name"}],
            wpointb: false,
            widthpont: 420,
            desbool: true,
            listpos: [{ cssnamepos: ".desription", cssheightnum: "4"}],
            tbrow: true,
            csstr: ".element-item",
            max: true
        });
        if ($(".wrapper-text table").size() > 0) {
            $(".wrapper-text table").after('<div class="table-responsive"></div>');
            $(".wrapper-text table").each(function(parameters) {
                $(this).addClass("table").appendTo($(this).next(".table-responsive"));
            });
        }
        if ($('.isolist').size() > 0) {
            var isolist = $('.isolist').imagesLoaded(function () {
                isolist.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            });
        }
        mysroll();
        mymenu2();
    });
    //function===============================================================================================
    // function mymenudes() use hover menu show menusub
    function mymenudes() {
        //mymenusub();
        //        $(window).resize(function () {
        //            mymenusubre();
        //        });
        $("#menu li").hover(function () {
            //$('.wrapper-all').show();
            //$("#wrapper").append('<div id="mask-bg"></div>');
            $(".mainbg").addClass("bgfilter");
            $("#banner").addClass("bgfilter");
            $(".wrapper-project").addClass("bgfilter");
            $(".wrapper-about").addClass("bgfilter");
            $(".wrapper-slider").addClass("bgfilter");
            $(this).find("> ul:first").stop(true, true).slideDown();
        }, function () {
            $(this).find("> ul:first").stop(true, true).slideUp();
        });
        $("#menu > li").mouseleave(function () {
            //$("#mask-bg").remove();
            $(".mainbg").removeClass("bgfilter");
            $("#banner").removeClass("bgfilter");
            $(".wrapper-project").removeClass("bgfilter");
            $(".wrapper-about").removeClass("bgfilter");
            $(".wrapper-slider").removeClass("bgfilter");
        });
        $("#menul2 li").hover(function () {
            $(".mainbg").addClass("bgfilter");
            $("#banner").addClass("bgfilter");
            $(".wrapper-project").addClass("bgfilter");
            $(".wrapper-about").addClass("bgfilter");
            $(".wrapper-slider").addClass("bgfilter");
            $(this).find("> ul:first").stop(true, true).slideDown();
        }, function () {
            $(this).find("> ul:first").stop(true, true).slideUp();
        });
        $("#menul2 > li").mouseleave(function () {
            //$("#mask-bg").remove();
            $(".mainbg").removeClass("bgfilter");
            $("#banner").removeClass("bgfilter");
            $(".wrapper-project").removeClass("bgfilter");
            $(".wrapper-about").removeClass("bgfilter");
            $(".wrapper-slider").removeClass("bgfilter");
        });
        $(".project-box").hover(function () {
            $(".project-box").each(function () {
                $(this).addClass("bgfilter");
            });
            $(this).toggleClass("filter");
            if ($(this).hasClass("filter")) {
                $(this).removeClass("bgfilter");
            }
            $(".mainbg").addClass("bgfilter");
            $("#banner").addClass("bgfilter");
            $(".wrapper-about").addClass("bgfilter");
            $(".wrapper-slider").addClass("bgfilter");

        });
        $(".project-box").mouseleave(function () {
            $(".project-box").each(function () {
                $(this).removeClass("bgfilter");
            });
            $(".mainbg").removeClass("bgfilter");
            $("#banner").removeClass("bgfilter");
            $(".wrapper-project").removeClass("bgfilter");
            $(".wrapper-about").removeClass("bgfilter");
            $(".wrapper-slider").removeClass("bgfilter");
        });
    }
    //function menu2
    function mymenu2() {
        $('*').click(function () {
            $(".button-menu a").click(function (e) {
                e.stopPropagation();
            });
            var idmenu2 = $(".button-menu a").attr("href");
            $(idmenu2).slideUp();
            if ($(idmenu2).css('display') == 'none') {
                $(".button-menu a").removeClass("current");
            }
        });
        $(".button-menu a").click(function (e) {
            $(this).toggleClass("current");
            var idmenu = $(this).attr("href");
            if ($(this).hasClass("current")) {
                $(idmenu).slideToggle();
            } else {
                $(idmenu).slideUp();
            }
            return false;
        });
    }
    // function menusroll() when scroll menu always top not scroll
    function menusroll() {
        var htop = $("#header").height();
        srollmenu(htop);
        $(window).scroll(function () {
            srollmenu(htop);
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                $(".footer-wrapper").addClass("footerscroll2");
            } else {
                $(".footer-wrapper").removeClass("footerscroll2");
            }
        });
    }
    function srollmenu(htop) {
        if ($(window).scrollTop() > htop) {
            $("#header-menu").addClass("header-sroll");
            $("#hotline").addClass("hotlineroll");
            $(".contactdesk").addClass("contactusroll");
            $(".footer-wrapper").addClass("footerscroll");
        } else {
            $("#header-menu").removeClass("header-sroll");
            $("#hotline").removeClass("hotlineroll");
            $(".contactdesk").removeClass("contactusroll");
            $(".footer-wrapper").removeClass("footerscroll");
        }
    }
    function mysroll() {
        mysrol();
        $(window).scroll(function () {
            mysrol();
        });
    }
    function mysrol() {
        var topsroll = $(window).scrollTop();
        if (topsroll > 100) {
            $("#sroltop").stop(true, true).animate({ "opacity": 0.5 }, 500);
            $("#wrapper #footer").addClass("position-relative");
        } else {
            $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
            $("#wrapper #footer").removeClass("position-relative");
        }
    }
})(jQuery);
