$(document).ready(function ()
{
    $('#advancedButton').toggle(function () {
        $('#advancedSearch').show();
    }, function() {
        $('#advancedSearch').hide();
    });
});