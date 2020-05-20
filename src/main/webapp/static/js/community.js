$(function(){
    $("#communityDg").datagrid({
        url:"/admin/community/getCommunityList",
        columns:[[
            {field:'id',title:'唯一序号',width:100,align:'center'},
            {field:'communityName',title:'社区名',width:100,align:'center'},
            {field:'maxPeople',title:'最大人口数',width:100,align:'center'}
        ]],
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        singleSelect:true,
        toolbar:"#tb"
    });

    //对话框
    $("#dialog").dialog({
        width:300,
        height:180,
        closed:true,
        shadow:true,
        buttons:[{
            text:'保存',
            handler:function () {
                //判断是保存还是编辑
                var id = $("[name='id']").val();
                var url = id?"/admin/community/updateCommunity":"/admin/community/saveCommunity";
                $("#communityForm").form("submit",{
                    url:url,
                    success:function (data) {
                        ajaxHandle("dialog","communityDg",data);
                    }
                });
            }
        },{
            text:'关闭',
            handler:function () {
                $("#dialog").dialog("close");
            }
        }]
    });

    $("#add").click(function () {
        $("#communityForm").form("clear");
        $("#dialog").dialog("open").dialog("setTitle","添加社区");
    });

    //删除一行
    $("#delete").click(function () {
        var rowData = $("#communityDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行删除");
            return;
        }
        $.ajax({
            url:'/admin/community/deleteCommunityById/'+rowData['id'],
            success:function (data) {
                ajaxHandle("dialog","communityDg",data);
            }
        });
    });

    //查询
    $("#searchBtn").click(function () {
        var keyword = $("[name='keyword']").val();
        $("#communityDg").datagrid("load",{keyword:keyword});
    });

    //刷新
    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#communityDg").datagrid("load",{});
    });

    //编辑
    $("#edit").click(function () {
        var rowData = $("#communityDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行编辑");
            return;
        }
        //弹出对话框
        $("#dialog").dialog("setTitle","编辑社区").dialog("open");
        //回显数据
        $("#communityForm").form("load",rowData);
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