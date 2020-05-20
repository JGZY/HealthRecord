$(function () {
    $.ajax({
        url:"/register/getCommunityList",
        type:"GET",
        success:function (data) {
            var community = $("#residentCommunity");
            $.each(data,function () {
                var optionEle = $("<option></option>").append(this.communityName).attr("value",this.id).css("color","black");
                optionEle.appendTo(community);
            });
        }
    });

    $("#registerBtn").click(function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/register/register" ,
            data: $('#registerForm').serialize(),
            success: function (data) {
                if(data.success){
                    alert("申请成功，等待管理员审核");
                    window.location.href="/login.jsp";
                }else{
                    alert(data.msg);
                }
            }
        });
    });


});