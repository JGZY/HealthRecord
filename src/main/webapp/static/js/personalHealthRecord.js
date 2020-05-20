$(function () {
    $("#personalHealthRecord").propertygrid({
        url:'/resident/getPersonalHealthRecord',
        showGroup:false,
        groupField:'name',
        groupFormatter:function (group,rows) {
            return;
        },
        toolbar:"#tb",
        onLoadError:function () {
            $("#personalHealthRecord").remove();
            $("#info").html("<h1 style='color: red'>等待管理员完善信息</h1><br>");
        }
    });
});