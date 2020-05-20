$(function () {

    $("#registerBtn").click(function () {
        window.location.href="/register.jsp";
    });

    /*$.ajax({
        url:"/login/getRoleList",
        type:"GET",
        success:function (data) {
            var community = $("#role");
            $.each(data,function (index,element) {
                var optionEle;
                if(index===0){
                    optionEle= $("<option></option>").append(this.rname+" (请选择您的角色)");
                }else{
                    optionEle= $("<option></option>").append(this.rname);
                }
                optionEle.attr("value",this.id).css("color","black");
                optionEle.appendTo(community);
            });
        }
    });*/

    $("#loginBtn").click(function () {
        $.post("/login",$("form").serialize(),function (data) {
            if(typeof data==="string"){
                data = $.parseJSON(data);
            }
            if(data.success){
                window.location.href="index.jsp";
            }else{
                alert(data.msg);
            }
        })
    });

    /*
    * 监听键盘按下enter键
    * */
    $(document).keyup(function(event){
        if(event.keyCode ===13){
            $("#loginBtn").trigger("click");
        }
    });
});