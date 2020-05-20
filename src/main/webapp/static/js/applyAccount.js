$(function () {

    //加载申请表格
    $("#applyDg").datagrid({
        url:"/admin/apply/applyAccountList",
        columns:[[
            {field:'residentName',title:'姓名',width:100,align:'center'},
            {field:'residentAccount',title:'账号名',width:100,align:'center'},
            /*{field:'residentBirth',title:'出生日期',width:100,align:'center'},
            {field:'residentGender',title:'性别',width:100,align:'center',formatter:function (value, row, index) {
                return row.residentGender===true?'男':'女';
            }},*/
            /*{field:'residentHeight',title:'身高(厘米)',width:100,align:'center'},
            {field:'residentWeight',title:'体重(千克)',width:100,align:'center'},*/
            {field:'residentPhone',title:'电话号码',width:100,align:'center'},
            {field:'residentCommunity',title:'居住小区',width:100,align:'center',formatter:function (value, row, index) {
                //row是一行数据
                if(row.residentCommunity){
                    return value.communityName!==null?value.communityName:'';
                }
                return '';
            }},
            /*{field:'residentHouse',title:'户籍地址',width:100,align:'center'},*/
            /*{field:'residentWork',title:'职业',width:100,align:'center'},*/
            {field:'residentApplyState',title:'审核状态',width:100,align:'center',formatter:function(value, row, index){
                if(row.residentApplyState===null){
                    return "<font style='color: blue'>尚未审核</font>";
                }
                if(!row.residentApplyState){
                    return "<font style='color: red'>审核未通过</font>";
                }
            }}
        ]],
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        toolbar:"#tb",
        singleSelect:true
    });

    //审核对话框
    $("#dialog").dialog({
        width:300,
        height:90,
        closed:true,
        buttons:[{
            text:'审核通过',
            handler:function(){
                $.ajax({
                    url:"/admin/apply/auditPass/"+auditId(),
                    success:function (data) {
                        ajaxHandle("dialog","applyDg",data);
                    }
                });
            }
        },{
            text:'审核未通过',
            handler:function(){
                $.ajax({
                    url:"/admin/apply/auditNoPass/"+auditId(),
                    success:function (data) {
                        ajaxHandle("dialog","applyDg",data);
                    }
                });
            }
        }]
    });

    //审核
    $("#verify").click(function () {
        var rowData = $("#applyDg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行审核");
            return;
        }
        if(rowData["residentApplyState"]===null){
            $("#dialog").dialog("setTitle","审核");
            $("#dialog").dialog("open");
            return;
        }
        if(!rowData["residentApplyState"]){
            $.messager.alert("警告","该数据已经审核,切勿重复审核");
            return;
        }
    });

    function auditId(){
        var rowData = $("#applyDg").datagrid("getSelected");
        return rowData["id"];
    }

    //刷新
    $("#reload").click(function () {
        $("#applyDg").datagrid("load",{});
    });

    function ajaxHandle(dialog,datagrid,data) {
        //有时候data为object，有时候为string，具体原因：Get/Post 会自动解析json
        //这里做一个判断，防止报错
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