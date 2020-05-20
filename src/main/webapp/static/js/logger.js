$(function () {
    $("#dg").datagrid({
        url:"/admin/logger/getLoggerList",
        columns:[[
            {field:'userName',title:'姓名',width:20,align:'center'},
            {field:'account',title:'账号',width:20,align:'center'},
            {field:'optime',title:'操作时间',width:30,align:'center'},
            {field:'ip',title:'ip地址',width:20,align:'center'},
            {field:'function',title:'操作方法',width:80,align:'center'},
            {field:'params',title:'操作参数',width:110,align:'center'/*,styler:function () {
                return "white-space:normal; word-break:break-all;overflow:hidden";
            }*/}
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