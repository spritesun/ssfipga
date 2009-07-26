//****** begin: search
// after ajax search complete
var searchCallback = function() {
    var requestUrl;

    $('#requestOverlay').hide();

    // set request button
    $('.request').click(function() {
        return GB_showCenter('Send request', this.href)
    });

    // drag to cart, creat a new div to show as a ghost helper
    $(".listItem").draggable({
        helper: function() {
            var $newDiv = $('<div class="onDragging" />');
            var $this = $(this);
            var strArray = ['.location', '.industry', '.level', '.official_grade', '.department', '.create_at'];
            $.each(strArray, function(index, value) {
                $('<div/>').text($this.find(value).text()).appendTo($newDiv);
            });
            $this.find('.listTools .cartAdd').clone().hide().appendTo($newDiv);
            return $newDiv[0];
        },
        zIndex:'10',
        refreshPositions: true,
        cursor: 'move',
        cursorAt: { top: 20, left: 20 }
    });
}

$(document).ready(function() {
    $("#col3").droppable({
        accept: ".listItem",
        activeClass: 'droppable-active',
        hoverClass: 'droppable-hover',
        drop: function(ev, ui) {
            // trigger click event of .cartAdd link_for_remote to post ajax request
            ui.draggable.find('.cartAdd').click();
        }
    });

    // search: advanced search button
    $('#advancedButton a').click(function () {
        $(this).text('hide advanced search');
        $('#advancedSearch').slideToggle();
        return false;
    });
});

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
