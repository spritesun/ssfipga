var searchCallback = function() {
    var requestUrl;

    // set tooltip
    $(".listTools a").tooltip({
        showURL: false
    });
    // 斑马线
    $('#content .listItem:even').css('background-color', '#F5F5F5');

    $('#requestOverlay').hide();

    // set request button
    $('.request').click(function() {
        requestUrl = $(this).attr('href');
        $.blockUI({ message: $('#requestOverlay'),
            css: {
                border: 'none',
                padding: '5px',
                backgroundColor: '#cfcfcf',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                color: '#fff',
                cursor: 'default'
            }
        });
        return false;
    });

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
        $.blockUI({
            message: $('<h1>add a new item</h1>'),
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
                    $('<li/>').text('new item').appendTo($('#shopCart ul')).effect("highlight", {}, 3000);
                }
            });
        }, 1000);

        return false;
    });

    // drag to cart
    $(".listItem").draggable({
        helper: 'clone',
        zIndex:'10'
    });
}

$(document).ready(function() {

    $("#col3").droppable({
        accept: ".listItem",
        activeClass: 'droppable-active',
        hoverClass: 'droppable-hover',
        drop: function(ev, ui) {
            //ui.draggable.appendTo($('#shopCart ul')).effect("highlight", {}, 3000);
            var $newLi = $('<li/>');
            var strArray = ['.location', '.industry', '.level', '.official_grade', '.department', '.create_at']
            $.each(strArray, function(index, value) {
                $('<div/>').text(ui.draggable.find(value).text()).appendTo($newLi);
            });
            $newLi.appendTo($('#shopCart ul')).effect("highlight", {}, 3000);
        }
    });
});