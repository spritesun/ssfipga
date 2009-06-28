$(document).ready(function() {
    $('.listToolRequest').click(function() {
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

    $('.listToolCartAdd').click(function() {
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
});