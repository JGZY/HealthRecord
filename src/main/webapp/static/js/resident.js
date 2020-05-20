$(function () {

    $("#dg").datagrid({
        url:"/admin/resident/getResidentList",
        columns:[[
            {field:'residentName',title:'姓名',width:100,align:'center'},
            {field:'residentAccount',title:'账号名',width:100,align:'center'},
            {field:'residentBirth',title:'出生日期',width:100,align:'center'},
            {field:'residentGender',title:'性别',width:100,align:'center',formatter:function (value, row, index) {
                if(row.residentGender===true){
                    return '男';
                }else if(row.residentGender===false){
                    return '女';
                }else{
                    return '';
                }
            }},
            {field:'residentHeight',title:'身高(厘米)',width:100,align:'center'},
            {field:'residentWeight',title:'体重(千克)',width:100,align:'center'},
            {field:'residentPhone',title:'电话号码',width:100,align:'center'},
            {field:'residentCommunity',title:'社区名',width:100,align:'center',formatter:function (value, row, index) {
                //row是一行数据
                return value!==null?value.communityName:'';
            }},
            {field:'residentHouse',title:'户籍地址',width:100,align:'center'},
            {field:'residentWork',title:'职业',width:100,align:'center'}
        ]],
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        toolbar:"#tb",
        singleSelect:true
    });

    //查询
    $("#searchBtn").click(function () {
        var keyword = $("[name='keyword']").val();
        $("#dg").datagrid("load",{keyword:keyword});
    });

    //刷新
    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#dg").datagrid("load",{});
        $("#community").combobox("reload","/admin/resident/getCommunityList");
    });

    $("#edit").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行编辑");
            return;
        }
        //弹出对话框
        $("#dialog").dialog("setTitle","编辑居民基本信息").dialog("open");
        //回显数据
        rowData["residentCommunity.id"] = rowData["residentCommunity"].id;
        $("#residentForm").form("load",rowData);
    });

    //对话框
    $("#dialog").dialog({
        width:300,
        height:480,
        closed:true,
        shadow:true,
        buttons:[{
            text:'保存',
            handler:function () {
                $("#residentForm").form("submit",{
                    url:"/admin/resident/updateResident",
                    success:function (data) {
                        ajaxHandle("dialog","dg",data);
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


    $("#delete").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行删除");
            return;
        }
        $.messager.confirm('确认对话框', '您想要删除该用户吗？', function(r){
            if (r){
                $.ajax({
                    url:'/admin/resident/deleteResidentById/'+rowData['id'],
                    success:function (data) {
                        ajaxHandle("dialog","dg",data);
                    }
                });
            }
        });
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

    //性别
    $("#gender").combobox({
        width:150,
        panelHeight:'auto',
        textField:"label",
        valueField:"value",
        data:[{
            label:'男',
            value:true
        },{
            label:'女',
            value:false
        }]
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