<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/1/1
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/community.js"></script>
</head>
<body>
    <div id="tb">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
        <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
        <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(社区)</a>
    </div>
    <table id="communityDg"></table>

    <div id="dialog">
        <form id="communityForm">
            <input type="hidden" name="id">
            <table align="center" style="border-spacing: 0 10px">
                <tr>
                    <td>社区名:</td>
                    <td><input type="text" name="communityName" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>最大人口数:</td>
                    <td><input type="text" name="maxPeople" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
