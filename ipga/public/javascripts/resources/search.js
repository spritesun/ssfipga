// search
$(document).ready(function ()
{
    $('#advancedButton a').toggle(function () {
        $(this).text('hide advanced search');
        $('#advancedSearch').show();
    }, function() {
        $(this).text('advanced search');
        $('#advancedSearch').hide();
    });

    // keyword
    $('#keyword').focus(function() {
        $(this).addClass('inputEnter');
    });
    $('#keyword').blur(function() {
        $(this).removeClass('inputEnter');
    });
});

// navigation
$(document).ready(function ()
{
    // 初始化三个nav
    var initNavigation = function () {
        $('#navigation div').each(function (index) {
            $(this).css('top', 5 + index * 105).css('line-height', '98px').height(98).show();
        });

        $('#navigation a.nav').each(function (index) {
            $(this).css('left', -1 + index * 186).hide().removeClass('selected');
        });
    }

    initNavigation();

    $('#navigation div').click(function () {
        $('#navigation div').hide().height(276).css({'line-height': '276px', 'top': '5px'});
        $(this).show();
        $('#navigation a.nav').show();
        $('#navigation a.nav:contains("' + $(this).text() + '")').addClass('selected');
        $('#returnLink').show();
    });

    $('#navigation a.nav').click(function () {
        $('#navigation a.nav').removeClass('selected');
        var $alink = $(this);
        $alink.addClass('selected');
        $('#navigation div').hide();
        $('#navigation div:contains("' + $alink.text() + '")').show();
        return false;
    })

    $('#returnLink').click(function () {
        $(this).hide();
        initNavigation();
        return false;
    })
});
