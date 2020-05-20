$(function () {
    $("#communityAdminDg").datagrid({
        url:"/admin/communityAdmin/getCommunityAdminList",
        columns:[[
            {field:'id',title:'唯一序号',width:100,align:'center'},
            {field:'name',title:'姓名',width:100,align:'center'},
            {field:'account',title:'账号',width:100,align:'center'},
            {field:'phone',title:'电话号码',width:100,align:'center'},
            {field:'community',title:'管理小区',width:100,align:'center',formatter:function (value, row, index) {
                //row是一行数据
                return value!==null?value.communityName:'';
            }}
        ]],
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        singleSelect:true,
        toolbar:"#tb"
    });

    //添加
    $("#add").click(function () {
        $("#communityAdminForm").form("clear");
        //弹出对话框
        $("[name='password']").validatebox({required:true});
        $("#password1").show();
        $("#password2").show();
        $("#dialog").dialog("setTitle","添加社区管理员").panel('resize',{height:410}).dialog("open");
    });

    //刷新
    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#communityAdminDg").datagrid("load",{});
        $("#community").combobox("reload","/admin/communityAdmin/getCommunityList");
    });

    //编辑
    $("#edit").click(function () {
        var rowData = $("#communityAdminDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行编辑");
            return;
        }
        $("#pwd").validatebox({required:false});
        $("#rpwd").validatebox({required:false});
        $("#password1").hide();
        $("#password2").hide();
        $("#dialog").dialog("setTitle","编辑社区管理员基本信息").panel('resize',{height:370}).dialog("open");
        rowData["community.id"] = rowData["community"].id;
        $("#communityAdminForm").form("load",rowData);
    });

    //查询
    $("#searchBtn").click(function () {
        var keyword = $("[name='keyword']").val();
        $("#communityAdminDg").datagrid("load",{keyword:keyword});
    });

    //删除
    $("#delete").click(function () {
        var rowData = $("#communityAdminDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行删除");
            return;
        }
        $.ajax({
            url:'/admin/communityAdmin/deleteCommunityAdminById/'+rowData['id'],
            success:function (data) {
                ajaxHandle("dialog","communityAdminDg",data);
            }
        });
    });

    //对话框
    $("#dialog").dialog({
        width:300,
        height:200,
        closed:true,
        shadow:true,
        model:true,
        buttons:[{
            text:'提交',
            handler:function () {
                var id = $("[name='id']").val();
                var url;
                if(id){
                    url="/admin/communityAdmin/editCommunityAdmin";
                }else{
                    url="/admin/communityAdmin/addCommunityAdmin";
                }
                $("#communityAdminForm").form('submit',{
                    url:url,
                    onSubmit:validatePassword(),
                    success:function (data) {
                        ajaxHandle("dialog","communityAdminDg",data);
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

    //社区选择下拉列表
    $("#community").combobox({
        width:150,
        panelHeight:'auto',
        editable:false,
        url:'/admin/communityAdmin/getCommunityList',
        textField:"communityName",
        valueField:"id",
        onLoadSuccess:function () {
            $("#community").each(function (i) {
                var span = $(this).siblings("span")[i];
                var targetInput = $(span).find("input:first");
                if(targetInput){
                    $(targetInput).attr("placeholder",$(this).attr("placeholder"));
                }
            });
        }
    });

    function validatePassword(){
        $.extend($.fn.validatebox.defaults.rules, {
            equals: {
                validator: function(value,param){
                    return value === $(param[0]).val();
                },
                message: '两次密码不匹配,请重新输入'
            }
        });
    }

    function ajaxHandle(dialog,datagrid,data) {
        if(typeof data==="string"){
            data = $.parseJSON(data);
        }
        if (data.success){
            $.messager.alert("温馨提示",data.msg);
            $("#"+dialog).dialog("close");
            $("#"+datagrid).datagrid("reload");
        } else {
            $.messager.alert("温馨提示(错误码"+data.code+")",data.msg);
        }
    }
});