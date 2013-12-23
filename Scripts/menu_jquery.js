$(document).ready(function () {
    $(document).ready(function () {


        ////ADDED
        $('.has-sub>a>span').before('<div class="arrow"></div>');

        $('.has-sub>a>div.arrow').fadeOut(200, function () {
            // Animation complete.
            if (!$('.has-sub').hasClass("active"))
            $('.has-sub').addClass('no-sub');
        });
            
      $(".leftnav").mouseleave(function () {
          $('.has-sub>a>div.arrow').fadeOut(200,function() {
              // Animation complete.
              if (!$('.has-sub').hasClass("active"))
              $('.has-sub').addClass('no-sub');
      });
          //$('.has-sub>a>div.arrowcliked').fadeOut('slow',function() {
          //    // Animation complete.
          //    $('.has-sub').addClass('no-sub');
          //});
          

      });

      $(".leftnav").mouseover(function () {
          $('.has-sub>a>div.arrow').fadeIn('slow');
          $('.has-sub>a>div.arrowcliked').fadeIn('slow');
          $('.has-sub').removeClass('no-sub');
      });

         

        ////$('.active>a').click(function () {

           

        ////});


        $('#cssmenu > ul > li ul').each(function (index, e) {
            var count = $(e).find('li').length;
            var content = '<span class="cnt">' + count + '</span>';
            //$(e).closest('li').children('a').append(content);
        });
        $('#cssmenu ul ul li:odd').addClass('odd');
        $('#cssmenu ul ul li:even').addClass('even');
        $('#cssmenu > ul > li > a').click(function () {
            $('li.has-sub').find('div.arrowcliked').removeClass('arrowcliked').addClass('arrow ');

            $('#cssmenu li').removeClass('active');
            $(this).closest('li').addClass('active');
            var checkElement = $(this).next();
            if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                $(this).closest('li').removeClass('active');
                checkElement.slideUp('normal');
                $(this).closest('li.has-sub').find('div.arrowcliked').removeClass('arrowcliked').addClass('arrow ');

            }
            if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#cssmenu ul ul:visible').slideUp('normal');
                checkElement.slideDown('normal');
              
                $(this).closest('li.has-sub').find('div.arrow').removeClass('arrow').addClass('arrowcliked ');
            }
            if ($(this).closest('li').find('ul').children().length == 0) {
                return true;
            } else {
                return false;
            }
        });

    });

});