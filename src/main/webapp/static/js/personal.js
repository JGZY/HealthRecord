$(function () {
    $("#registerInfo").propertygrid({
        url:'/resident/getRegisterInfo',
        showGroup:false,
        groupField:'name',
        groupFormatter:function (group,rows) {
            return ;
        },
        toolbar:"#tb"
    });

    //社区选择下拉列表
    $("#community").combobox({
        width:150,
        panelHeight:'auto',
        editable:false,
        url:'/admin/resident/getCommunityList',
        textField:"communityName",
        valueField:"id"
    });

    function ajaxHandle(dialog,datagrid,data) {
        if(typeof data==="string"){
            data = $.parseJSON(data);
        }
        if (data.success){
            $.messager.alert("温馨提示",data.msg);
            /*关闭对话框 */
            $("#"+dialog).dialog("close");
            /*重新加载数据表格*/
            $("#"+datagrid).datagrid("reload");
        } else {
            $.messager.alert("温馨提示(错误码"+data.code+")",data.msg);
        }
    }
});