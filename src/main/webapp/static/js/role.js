$(function () {
    $("#roleDg").datagrid({
        url:"/admin/role/getRoleList",
        columns:[[
            {field:'rnum',title:'角色编号',width:100,align:'center'},
            {field:'rname',title:'角色名称',width:100,align:'center'}
        ]],
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        toolbar:"#tb",
        singleSelect:true
    });

    $("#dialog").dialog({
        width:600,
        height:600,
        shadow:true,
        buttons:[{
            text:'保存',
            handler:function () {
                var rid  = $("[name='rid']").val();
                var url;
                if(rid){
                    url='/admin/role/updateRole';
                }else{
                    url='/admin/role/saveRole';
                }
                $("#roleForm").form("submit",{
                    url:url,
                    onSubmit:function (param) {
                        var allRows = $("#role_data2").datagrid("getRows");
                        for(var i=0;i<allRows.length;i++){
                            var row = allRows[i];
                            param["permissions["+i+"].pid"] = row.pid;
                        }
                    },
                    success:function (data) {
                        ajaxHandle("dialog","roleDg",data);
                    }
                });
            }
        },{
            text:'关闭',
            handler:function () {
                $("#dialog").dialog("close");
            }
        }],
        closed:true
    });

    //添加
    $("#add").click(function () {
        /*$("#roleForm").form("clear");
        $("#role_data2").datagrid("loadData",{rows:[]});*/
        $("#pDialog").dialog("setTitle","添加权限").dialog("open");
    });

    //编辑
    $("#edit").click(function () {
        var rowData = $("#roleDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行编辑");
            return;
        }
        $("#roleForm").form("load",rowData);
        var roleData2 = $("#role_data2");
        var options = roleData2.datagrid("options");
        options.url="/admin/role/getPermissionByRid/"+rowData.rid;
        roleData2.datagrid("load");
        $("#dialog").dialog("setTitle","编辑角色").dialog("open");
    });

    //删除
    $("#delete").click(function () {
        var rowData = $("#roleDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行删除");
            return;
        }else{
            $.messager.confirm("确认","确认删除该角色吗",function (r) {
                if(r){
                    $.get("/admin/role/deleteRole/"+rowData.rid,function (data) {
                        ajaxHandle("dialog","roleDg",data);
                    });
                }
            });
        }
    });

    //刷新
    $("#reload").click(function () {
        $("#roleDg").datagrid("load",{});
    });

    //权限列表
    $("#role_data1").datagrid({
        title:"所有权限",
        url:"/admin/role/getPermissionList",
        height:400,
        width:250,
        fitColumns:true,
        singleSelect:true,
        columns:[[
            {field:'pname',title:'权限名称',width:100,align:'center'}
        ]],
        onClickRow:function (rowIndex,rowData) { /*点击权限时的回调函数*/
            var roleData2 = $("#role_data2");
            var allRows =roleData2.datagrid("getRows");
            for(var i=0;i<allRows.length;i++){
                var row=allRows[i];
                if(rowData.pid===row.pid){ //已存在
                    var index=roleData2.datagrid("getRowIndex",row);
                    roleData2.datagrid("selectRow",index);
                    return;
                }
            }
            roleData2.datagrid("appendRow",rowData);
        }
    });

    //选中权限列表
    $("#role_data2").datagrid({
        title:"已选权限",
        height:400,
        width:250,
        fitColumns:true,
        singleSelect:true,
        columns:[[
            {field:'pname',title:'权限名称',width:100,align:'center'}
        ]],
        onClickRow:function (rowIndex,rowData){
            $("#role_data2").datagrid("deleteRow",rowIndex);
        }
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

    //审核对话框
    $("#pDialog").dialog({
        width:350,
        height:170,
        closed:true,
        buttons:[{
            text:'保存',
            handler:function(){
                $.ajax({
                    url:"/admin/role/addPermission",
                    data:$("#permissionForm").serialize(),
                    success:function (data) {
                        ajaxHandle("pDialog","roleDg",data);
                        $("#role_data1").datagrid({url:"/admin/role/getPermissionList"});
                    }
                });
            }
        }]
    });
});