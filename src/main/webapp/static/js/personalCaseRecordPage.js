$(function () {
    $("#dg").datagrid({
        url:"/resident/getPersonalCaseRecordList",
        columns:[[
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
            {field:'status',title:'初/复诊',width:100,align:'center',formatter:function (value, row, index) {
                return row.status==='0'?"初诊":"复诊";
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

    $("#reload").click(function () {
        var keyword = $("[name='keyword']").val('');
        $("#dg").datagrid("load",{});
    });

    //查询
    $("#searchBtn").click(function () {
        var keyword = $("[name='keyword']").val();
        $("#dg").datagrid("load",{keyword:keyword});
    });
});