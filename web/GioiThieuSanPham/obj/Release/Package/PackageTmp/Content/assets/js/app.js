$(function () {
    function validateEmail($email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test($email);
    }
    $('#btndathang').click(function () {
        var masp = $(this).data('id');
        var email = $('#txtemail').val();
        if (email == "")
            alert("Bạn chưa nhập email.");
        else
            if(!validateEmail(email))
                alert("Email không đúng định dạng.");
        else {
            $.ajax({
                url: "/dat-hang",
                data: JSON.stringify({ masp, email }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (data) {
                    console.log(data)
                    if (data == "1")
                    {
                        $('#btnclose').click();
                        alert('Đặt hàng thành công');
                    }
                    else if (data == "0")
                        alert('Đặt hàng thất bại');
                    else
                        alert('Sản phẩm này đã hết hàng.');

                },
                error: function (data) {

                    alert(JSON.stringify(data));
                }
            });
        }
    })
})