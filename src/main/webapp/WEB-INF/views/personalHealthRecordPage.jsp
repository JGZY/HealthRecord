<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/3/27
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <link href="../../static/css/base.css" rel="stylesheet">
    <link href="../../static/css/basic_info.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/personalHealthRecord.js"></script>
    <style>
        .datagrid-cell{
            white-space:normal;
            word-break:break-all
        }
    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <div class="easyui-tabs1" style="width:100%;">
            <div title="基本信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">个人健康档案信息</span></div>
                <div id="info"></div>
                <table class="kv-table" id="personalHealthRecord">

                </table>

            </div>
        </div>
    </div>
</div>
</body>
</html>
