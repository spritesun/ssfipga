//****** begin: search
// after ajax search complete
var searchCallback = function() {
    var requestUrl;

    // set tooltip
    $(".listTools a").tooltip({
        showURL: false
    });
    // 斑马线
    $('#content .listItem:even').css('background-color', '#F5F5F5');

    $('#requestOverlay').hide();

    //// set request button
    //$('.request').click(function() {
    //    requestUrl = $(this).attr('href');
    //    $.blockUI({ message: $('#requestOverlay'),
    //        css: {
    //            border: 'none',
    //            padding: '5px',
    //            backgroundColor: '#cfcfcf',
    //            '-webkit-border-radius': '10px',
    //            '-moz-border-radius': '10px',
    //            color: '#fff',
    //            cursor: 'default'
    //        }
    //    });
    //    return false;
    //});

    $('#yes').click(function() {
        // update the block message
        $.blockUI({ message: "<h1>sending request...</h1>",
            css: {
                border: 'none',
                padding: '10px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }
        });

        $.ajax({
            url: requestUrl,
            cache: false,
            success: function(data) {
                // unblock when remote call returns
                alert(data);
                $.unblockUI();
            }
        });
    });

    $('#no').click(function() {
        $.unblockUI();
        return false;
    });

    // click button, add to cart
    $('.cartAdd').click(function() {
        var $item = $(this).parent().parent();
        $.blockUI({
            message: $('<h1>adding a new item</h1>'),
            css: {
                border: 'none',
                padding: '0px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }
        });
        setTimeout(function() {
            $.unblockUI({
                onUnblock: function () {
                    //$('<li/>').text('new item').appendTo($('#shopCart ul')).effect("highlight", {}, 3000);
                    add_to_cart($item);
                }
            });
        }, 500);

        return false;
    });

    // drag to cart
    $(".listItem").draggable({
        helper: function() {
            //return $(this).clone().addClass('onDragging')[0];
            var $newDiv = $('<div class="onDragging" />');
            var $this = $(this);
            var strArray = ['.location', '.industry', '.level', '.official_grade', '.department', '.create_at'];
            $.each(strArray, function(index, value) {
                $('<div/>').text($this.find(value).text()).appendTo($newDiv);
            });
            return $newDiv[0];
        },
        zIndex:'10',
        refreshPositions: true,
        cursor: 'move'
    });

    // click item div to show resource
    $('.listItem').click(function () {
        window.location.href = $(this).find('.show').attr('href');
    });

    $('.listTools a').click(function(event) {
        event.stopPropagation();
    });
}

$(document).ready(function() {

    $("#col3").droppable({
        accept: ".listItem",
        activeClass: 'droppable-active',
        hoverClass: 'droppable-hover',
        drop: function(ev, ui) {
            add_to_cart(ui.draggable);
        }
    });

    // search: advanced search button
    $('#advancedButton a').click(function () {
        $(this).text('hide advanced search');
        $('#advancedSearch').slideToggle();
        return false;
    });
});

var add_to_cart = function(draggable) {
    var $newLi = $('<li/>');
    var strArray = ['.location', '.industry', '.level', '.official_grade', '.department', '.create_at'];
    $.each(strArray, function(index, value) {
        $('<div/>').text(draggable.find(value).text()).appendTo($newLi);
    });
    $newLi.appendTo($('#shopCart ul')).effect("highlight", {}, 3000);
};
//****** end: search

// 导航块 navigation
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
