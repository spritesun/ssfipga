$(document).ready(function() {
    // 斑马线
    $('#content .listItem:even').css('background-color', '#F5F5F5');

    // request
    $('.request').click(function() {
        $.blockUI({
            message: $('<h1>sending a request</h1>'),
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }
        });
        setTimeout($.unblockUI, 2000);
        return false;
    })

    // click button, add to cart
    $('.cartAdd').click(function() {
        $.blockUI({
            message: $('<h1>add a new item</h1>'),
            css: {
                border: 'none',
                padding: '15px',
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
    $("#col3").droppable({
        accept: ".listItem",
        activeClass: 'droppable-active',
        hoverClass: 'droppable-hover',
        drop: function(ev, ui) {
            $('<li/>').text('new item').appendTo($('#shopCart ul')).effect("highlight", {}, 3000);
        }
    });

});