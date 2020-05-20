$(function () {
    $("#dg").datagrid({
        url:"/consultant/getHealthRecordList",
        columns:[[
            {field:'name',title:'姓名',width:100,align:'center'},
            {field:'account',title:'账号名',width:100,align:'center'},
            {field:'community',title:'社区',width:100,align:'center',formatter:function (value, row, index) {
                //row是一行数据
                return value!==null?value.communityName:'';
            }},
            {field:'highBlood',title:'高血压',width:100,align:'center',formatter:function (value, row, index) {
                if(row.highBlood===true){
                    return '是';
                }else if(row.highBlood===false){
                    return '否';
                }else{
                    return '';
                }
            }},
            {field:'covid',title:'新型冠状病毒',width:100,align:'center',formatter:function (value, row, index) {
                if(row.covid===true){
                    return '是';
                }else if(row.covid===false){
                    return '否';
                }else{
                    return '';
                }
            }},
            {field:'familyIllness',title:'家族遗传病',width:100,align:'center'},
            {field:'bloodType',title:'血型',width:100,align:'center'},
            {field:'colorBlind',title:'色盲',width:100,align:'center'},
            {field:'bloodSugar',title:'血糖',width:100,align:'center'},
            {field:'whiteBlood',title:'白血病',width:100,align:'center',formatter:function (value, row, index) {
                if(row.whiteBlood===true){
                    return '是';
                }else if(row.whiteBlood===false){
                    return '否';
                }else{
                    return '';
                }
            }},
            {field:'vaccin',title:'疫苗信息',width:100,align:'center'},
            {field:'remark',title:'备注',width:100,align:'center'}
        ]],
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        toolbar:"#tb",
        singleSelect:true
    });

    //添加
    $("#add").click(function () {
        //社区选择下拉列表
        $("#community").combobox({
            width:155,
            panelHeight:'auto',
            editable:false,
            url:'/admin/resident/getCommunityList',
            textField:"communityName",
            valueField:"id",
            onLoadSuccess:function () {
                $.get("/consultant/getConsultantCommunityId",function (data) {
                    $("#community").combobox('select',data);
                });
            }
        });
        $("#healthForm").form("clear");
        $("#dialog").dialog("setTitle","添加社区居民健康档案").panel('resize',{height:410}).dialog("open");
    });

    //编辑
    $("#edit").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if(rowData===null){
            $.messager.alert("提示","选择一行数据进行编辑");
            return;
        }
        //社区选择下拉列表
        $("#community").combobox({
            width:155,
            panelHeight:'auto',
            editable:false,
            url:'/admin/resident/getCommunityList',
            textField:"communityName",
            valueField:"id"
        });
        //弹出对话框
        $("#dialog").dialog("setTitle","编辑社区居民健康档案").panel('resize',{height:370}).dialog("open");
        //回显数据
        rowData["community.id"] = rowData["community"].id;
        $("#healthForm").form("load",rowData);
    });

    //查询
    $("#searchBtn").click(function () {
        var keyword = $("[name='keyword']").val();
        $("#dg").datagrid("load",{keyword:keyword});
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
                var id = $("[name='id']").val();
                var url;
                if(id){
                    url="/consultant/editHealthRecord";
                }else{
                    url="/consultant/insertHealthRecord";
                }
                $("#healthForm").form("submit",{
                    url:url,
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

    //刷新
    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#dg").datagrid("load",{});
        $("#community").combobox("reload","/admin/resident/getCommunityList");
    });

    //高血压
    $("#highBlood").combobox({
        width:155,
        panelHeight:'auto',
        textField:"label",
        valueField:"value",
        data:[{
            label:'是',
            value:true
        },{
            label:'否',
            value:false
        }]
    });

    //新型冠状病毒
    $("#covid").combobox({
        width:155,
        panelHeight:'auto',
        textField:"label",
        valueField:"value",
        data:[{
            label:'是',
            value:true
        },{
            label:'否',
            value:false
        }]
    });

    //白血病
    $("#whiteBlood").combobox({
        width:155,
        panelHeight:'auto',
        textField:"label",
        valueField:"value",
        data:[{
            label:'是',
            value:true
        },{
            label:'否',
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