<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/3/28
  Time: 0:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/personalCaseRecordPage.js"></script>
    <style>
        .datagrid-cell{
            white-space:normal;
            word-break:break-all
        }
    </style>
</head>
<body>
<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
    <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
    <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(医师姓名、医师账号、医院)</a>
</div>
<table id="dg">

</table>
</body>
</html>
