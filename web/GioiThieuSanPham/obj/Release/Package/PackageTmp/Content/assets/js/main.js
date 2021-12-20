$('.custom-checkbox').on('click', function () {
    var path = window.location.search;
    // console.log(path);
    if ($(this).is(":checked")) {
        console.log(path);

        if (path.indexOf("?gia") >= 0 && path.indexOf('&hangsx=') < 0) {
            path += '&hangsx=' + $(this).val();
        } else
            if (path.indexOf("?") < 0) {
                path = path + "?hangsx=";
                path += $(this).val();
            }
            else {
                if (path.lastIndexOf('&gia') > 0) {
                    var hangsx = path.substring(0, path.lastIndexOf('&'));
                    var gia = path.substring(path.lastIndexOf('&'), path.length);
                    console.log(gia);
                    hangsx += "%2C" + $(this).val();
                    console.log(hangsx);
                    path = hangsx + gia;
                }
                else
                    path += "%2C" + $(this).val();

            }
        //console.log(path );
        window.location.href = path;
    }
    else {
        var checkPhay = $(this).val() + "%2C";
        if (path === "?hangsx=" + $(this).val()) {
            path = window.location.pathname;
        }
        else
            if (path.indexOf('gia') >= 0) {
                if (path.indexOf('?gia') >= 0) {
                    var temp = path.substring(path.lastIndexOf('&') + 1, path.length);
                    if (temp === "hangsx=" + $(this).val()) {
                        path = window.location.pathname + path.substring(0, path.lastIndexOf('&'));
                        console.log(path);
                    }
                }
                else {
                    if (path.indexOf('?hangsx=' + $(this).val() + '&') >= 0) {
                        var temp = path.substring(path.indexOf('gia'), path.length);
                        path = window.location.pathname + '?' + temp;
                    }
                }
            }
        if (path.indexOf(checkPhay) > 0) {
            path = path.replace(checkPhay, "");
            console.log(1);
        }
        else
            if (path.indexOf("%2C" + $(this).val()) > 0) {
                path = path.replace("%2C" + $(this).val(), "");
                console.log(2);
            }
            else {
                path = path.replace($(this).val(), "");
                console.log(3);
            }
        //console.log(path);

        window.location.href = path;
    }
})
$(function () {
    $('.custom-checkbox').each(function (i, item) {
        if (window.location.search.toLocaleLowerCase().indexOf($(item).val().toLocaleLowerCase()) >= 0) {
            $(item).attr("checked", true);
        }
    });

});
