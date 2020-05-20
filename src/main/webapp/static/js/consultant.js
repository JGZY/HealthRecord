$(function () {
    $("#dg").datagrid({
        url:"/admin/consultant/getConsultantList",
        columns:[[
            {field:'consultantName',title:'姓名',width:100,align:'center'},
            {field:'consultantAccount',title:'账号名',width:100,align:'center'},
            {field:'consultantAge',title:'年龄',width:100,align:'center'},
            {field:'consultantGender',title:'性别',width:100,align:'center',formatter:function (value, row, index) {
                return row.consultantGender?'男':'女';
            }},
            {field:'consultantPhone',title:'电话号码',width:100,align:'center'},
            {field:'community',title:'服务小区',width:100,align:'center',formatter:function (value, row, index) {
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
        $("#consultantForm").form("clear");
        //弹出对话框
        $("[name='consultantPassword']").validatebox({required:true});
        $("#password1").show();
        $("#password2").show();
        $("#dialog").dialog("setTitle","添加社区医师").panel('resize',{height:410}).dialog("open");
    });

    //刷新
    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#dg").datagrid("load",{});
        $("#community").combobox("reload","/admin/consultant/getCommunityList");
    });

    //编辑
    $("#edit").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行编辑");
            return;
        }
        $("[name='consultantPassword']").validatebox({required:false});
        $("#password1").hide();
        $("#password2").hide();
        //弹出对话框
        $("#dialog").dialog("setTitle","编辑社区医师基本信息").panel('resize',{height:370}).dialog("open");
        //回显数据
        rowData["community.id"] = rowData["community"].id;
        $("#consultantForm").form("load",rowData);
    });

    //查询
    $("#searchBtn").click(function () {
        var keyword = $("[name='keyword']").val();
        $("#dg").datagrid("load",{keyword:keyword});
    });

    $("#delete").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行删除");
            return;
        }
        $.ajax({
            url:'/admin/consultant/deleteConsultantById/'+rowData['id'],
            success:function (data) {
                ajaxHandle("dialog","dg",data);
            }
        });
    });

    //对话框
    $("#dialog").dialog({
        width:300,
        height:400,
        closed:true,
        shadow:true,
        buttons:[{
            text:'提交',
            handler:function () {
                var id = $("[name='id']").val();
                var url;
                if(id){
                    url="/admin/consultant/editConsultant";
                }else{
                    url="/admin/consultant/addConsultant";
                }
                $("#consultantForm").form('submit',{
                    url:url,
                    onSubmit:validatePassword(),
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

    //社区选择下拉列表
    $("#community").combobox({
        width:150,
        panelHeight:'auto',
        editable:false,
        url:'/admin/consultant/getCommunityList',
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

    //性别
    $("#gender").combobox({
        width:150,
        panelHeight:'auto',
        textField:"label",
        valueField:"value",
        editable:false,
        data:[{
            label:'男',
            value:true
        },{
            label:'女',
            value:false
        }],
        onLoadSuccess:function () {
            $("#gender").each(function (i) {
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
            /*关闭对话框 */
            $("#"+dialog).dialog("close");
            /*重新加载数据表格*/
            $("#"+datagrid).datagrid("reload");
        } else {
            $.messager.alert("温馨提示(错误码"+data.code+")",data.msg);
        }
    }
});