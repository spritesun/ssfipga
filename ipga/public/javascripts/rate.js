// 重置ratestar
var setRate = function(rate) {
    var $rate = $('#rateStars');
    $('.rateStar').remove();
    for (var i = 0; i < 5; i++) {
        if (i < rate) {
            $('<span num="' + i + '" class="rateStar rateY" />').appendTo($rate);
        }
        else {
            $('<span num="' + i + '" class="rateStar rateN" />').appendTo($rate);
        }
    }
    // 注册单击事件
    $('.rateStar').click(function () {
        setRate(parseFloat($(this).attr('num')) + 1);
    })

    $('#resource_strength_id').val(rate);
}

// 初始化ratestar, 默认为3
$(document).ready(function () {
    var $strength = $('#resource_strength_id');
    $strength.hide().after('<div id="rateStars" />');
    if ($strength.val() == '') {
        setRate(3);
    }
    else {
        setRate($strength.val());
    }
});