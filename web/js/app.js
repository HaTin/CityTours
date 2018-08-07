$(function () {
    let currentIndex;
    let isLoc = 1;
    var originClick = function (data) {
        // show hidden a tag  
        $('#destination a:hidden').show();
        // current index of li
        currentIndex = data.selectedIndex;
        // get li tag of destination with same index 
        if (currentIndex == 0) {
            return;
        }
        var li = $('#destination').children().children('li').children()[currentIndex];
        // compare with current value of origin option
        if ($(li).find("input:hidden").val() == data.selectedItem.find('input:hidden').val()) {
            $(li).hide();
        }
    }
    var getLocation = function (text, id, option, fn) {
        $.ajax({
            data: {text: text, id: id},
            url: 'getLocation',
            type: 'GET',
            success: function (ddata) {
                $(`#${option}`).ddslick({
                    data: ddata,
                    width: 320,
                    imagePosition: "left",
                    onSelected: fn
                })
            },
            error: function (e) {
                alert('error');
            }
        });
    }
    getLocation('Origin', 1, 'origin', originClick);
    getLocation('Destination', 1, 'destination');
    $('#category').ddslick({
        showSelectedHTML: true,
        onSelected: function (data) {
            var index = data.selectedData.value;
            if (index == isLoc)
                return;
            $('#destination').ddslick('destroy');
            getLocation('Destination', index, 'destination');
            isLoc = index;

        }
    });
    $('#search-tour button').on('click', function (e) {
        var originData = $('#origin').data('ddslick');
        var desData = $('#destination').data('ddslick');
        if (originData.selectedIndex === 0) {
            e.preventDefault();
            $('#origin').next().removeClass('hide');
        } else {
            $('#origin').next().addClass('hide');
        }
        if (desData.selectedIndex === 0) {
            e.preventDefault();
            $('#destination').next().removeClass('hide');
        } else {
            $('#destination').next().addClass('hide');
        }
    });

});


