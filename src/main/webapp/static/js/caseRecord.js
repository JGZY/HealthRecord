$(function () {
    $("#dg").datagrid({
        url:"/consultant/getCaseRecordList",
        columns:[[
            {field:'name',title:'姓名',width:100,align:'center',formatter:function (value, row, index) {
                return row!==null?row.resident.residentName:'';
            }},
            {field:'account',title:'账号名',width:100,align:'center',formatter:function (value, row, index) {
                return row!==null?row.resident.residentAccount:'';
            }},
            {field:'createTime',title:'病历时间',width:100,align:'center',formatter:function (value, row, index){
                var date = new Date(row.createTime);
                Y = date.getFullYear() + '-';
                M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                D = date.getDate() + ' ';
                h = date.getHours() + ':';
                m = date.getMinutes() + ':';
                s = date.getSeconds();
                return Y+M+D+h+m+s;
            }},
            {field:'hospital',title:'医院',width:100,align:'center'},
            {field:'dept',title:'科室',width:100,align:'center'},
            {field:'complain',title:'主诉',width:100,align:'center'},
            {field:'history',title:'病史',width:100,align:'center'},
            {field:'diagnose',title:'诊断',width:100,align:'center'},
            {field:'Consultant',title:'医师姓名(账号)',width:100,align:'center',formatter:function (value, row, index) {
                return row!==null?row.consultant.consultantName+'('+row.consultant.consultantAccount+')':'';
            }},
            {field:'view',title:'意见',width:100,align:'center'},
            {field:'status',title:"初诊/复诊",width:100,align:'center',formatter:function (value, row, index) {
                return row.status==='0'?'初诊':'复诊';
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

    //刷新
    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#dg").datagrid("load",{});
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
                $("#caseRecordForm").form("submit",{
                    url:"/consultant/insertCaseRecord",
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

    //添加
    $("#add").click(function () {
        $("#caseRecordForm").form("clear");
        $("#dialog").dialog("setTitle","添加社区居民病历").panel('resize',{height:410}).dialog("open");
    });

    /*excel上传窗口*/
    $("#excelUpload").dialog({
        width:300,
        height: 180,
        title:"导入Excel",
        modal:true,
        buttons: [{
            text:'保存',
            handler:function () {
                $("#uploadForm").form("submit",{
                    url:"/consultant/uploadExcelFile",
                    success:function (data) {
                        data=$.parseJSON(data);
                        if(data.success){
                            $.messager.alert("温馨提示:",data.msg);
                            /*关闭对话框*/
                            $("#excelUpload").dialog("close");
                            /*数据表格重新加载*/
                            $("#dg").datagrid("reload");
                        }else{
                            $.messager.alert("温馨提示:",data.msg);
                        }
                    }
                });
            }
        },{
            text:'关闭',
            handler:function () {
                $("#excelUpload").dialog("close");
            }
        }],
        closed: true
    });

    /*导入按钮的点击*/
    $("#excelIn").click(function () {
        $("#excelUpload").dialog("open");
    });

    /*下载模板按钮的点击*/
    $("#downloadTml").click(function () {
        window.open("/consultant/downloadExcelTpl");
    });

    /*导出按钮的点击*/
    $("#excelOut").click(function () {
        window.open('/consultant/downloadExcel');
    });

    //初诊/复诊
    $("#status").combobox({
        width:150,
        panelHeight:'auto',
        textField:"label",
        valueField:"value",
        editable:false,
        data:[{
            label:'初诊',
            value:'0'
        },{
            label:'复诊',
            value:'1'
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