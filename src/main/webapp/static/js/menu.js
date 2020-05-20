$(function () {

    $("#menu_datagrid").datagrid({
        url:"/admin/menu/menuList",
        columns:[[
            {field:'text',title:'名称',width:100,align:'center'},
            {field:'url',title:'跳转地址',width:100,align:'center'},
            {field:'parent',title:'父菜单',width:100,align:'center',formatter:function(value,row,index){
                    return value?value.text:'';
                }
            },
            {field:'permission',title:'权限',width:100,align:'center',formatter:function(value,row,index){
                return value?value.pname:'';
                }
            }
        ]],
        fit:true,
        rownumbers:true,
        singleSelect:true,
        striped:true,
        pagination:true,
        fitColumns:true,
        toolbar:'#menu_toolbar'
    });

    /*
     * 初始化新增/编辑对话框
     */
    $("#dialog_div").dialog({
        width:300,
        height:240,
        closed:true,
        buttons:'#menu_dialog_bt'
    });

    /*设置palceHolder*/
    function setPlaceHolder(a){
        $(a).each(function (i) {
            var span = $(this).siblings("span")[i];
            var targetInput = $(span).find("input:first");
            if(targetInput){
                $(targetInput).attr("placeholder",$(this).attr("placeholder"));  //显示placeholder的内容
            }
        });
    }

    $("#parentMenu").combobox({
        width:157,
        panelHeight:'auto',
        url:'/admin/menu/parentList',
        valueField:'id',
        textField:'text',
        editable:false,
        onLoadSuccess:function (){
            setPlaceHolder("#parentMenu");
        }
    });

    $("#permission").combobox({
        width:157,
        panelHeight:'auto',
        url:'/admin/menu/permissionList',
        valueField:'pid',
        textField:'pname',
        editable:false,
        onLoadSuccess:function (){
            setPlaceHolder("#permission");
        }
    });

    /*添加菜单*/
    $("#add").click(function () {
        $("#menu_form").form("clear");
        $("#dialog_div").dialog("setTitle","添加菜单");
        $("#dialog_div").dialog("open");
    });

    /*编辑菜单*/
    /*编辑按钮的点击*/
    $("#edit").click(function () {
        $("#menu_form").form("clear");
        /*获取当前选中的行*/
        var rowData=$("#menu_datagrid").datagrid("getSelected");
        if(!rowData){
            $.messager.alert("提示","请选择一行数据进行编辑");
            return;
        }
        /*父菜单回显*/
        if(rowData.parent){
            rowData["parent.id"]=rowData.parent.id;
        }else{
            setPlaceHolder("#parentMenu")
        }
        if(rowData.permission){
            rowData["permission.pid"]=rowData.permission.pid;
        }else{
            setPlaceHolder("#permission")
        }
        $("#dialog_div").dialog("setTitle","编辑菜单");
        $("#dialog_div").dialog("open");
        /*选中数据回显*/
        $("#menu_form").form("load",rowData);
    });

    /*保存按钮的点击*/
    $("#save").click(function () {
        var parent_id= $("[name='parent.id']").val();
        var id = $("[name='id']").val();
        var url ;
        if(id){
            if(id===parent_id){
                $.messager.alert("提示","不能设置自己为自己的父菜单");
                return;
            }
        }
        /*判断保存还是编辑*/
        if(id){
            /*编辑*/
            url="/admin/menu/updateMenu";
        }else{
            /*添加*/
            url="/admin/menu/saveMenu";
        }
        $("#menu_form").form("submit",{
            url:url,
            success:function (data) {
                data=$.parseJSON(data);
                if(data.success){
                    $.messager.alert("温馨提示:",data.msg);
                    /*关闭对话框*/
                    $("#dialog_div").dialog("close");
                    $("#parentMenu").combobox("reload");
                    /*数据表格重新加载*/
                    $("#menu_datagrid").datagrid("reload");
                }else{
                    $.messager.alert("温馨提示:",data.msg);
                }
            }
        });

    });

    /*取消按钮的点击*/
    $("#cancel").click(function () {
        $("#dialog_div").dialog("close");
    });

    /*删除按钮*/
    $("#del").click(function () {
        /*获取当前选中的行*/
        var rowData=$("#menu_datagrid").datagrid("getSelected");
        if(!rowData){
            $.messager.alert("提示","请选择一行进行删除");
            return;
        }
        $.messager.confirm("确认","是否做删除操作",function (res) {
            if(res){
                $.get("/admin/menu/deleteById?id="+rowData.id,function (data) {
                    if(data.success){
                        $.messager.alert("温馨提示:",data.msg);
                        /*数据表格重新加载*/
                        $("#menu_datagrid").datagrid("reload");
                        $("#parentMenu").combobox("reload");
                    }else{
                        $.messager.alert("温馨提示:",data.msg);
                    }
                });
            }
        });
    });

    //刷新
    $("#reload").click(function () {
        $("#menu_datagrid").datagrid("load");
    });
});