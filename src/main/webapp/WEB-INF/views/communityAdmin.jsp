<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/1/20
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/communityAdmin.js"></script>
</head>
<body>
    <div id="tb">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
        <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
        <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(姓名、账号、电话、社区)</a>
    </div>
    <table id="communityAdminDg"></table>
    <div id="dialog">
        <form id="communityAdminForm">
            <input type="hidden" name="id">
            <table align="center" style="border-spacing: 0 10px">
                <tr>
                    <td>姓名:</td>
                    <td><input type="text" name="name" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>账号名:</td>
                    <td><input type="text" name="account" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>电话号码:</td>
                    <td><input type="text" name="phone" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>管理小区:</td>
                    <td><select id="community" name="community.id" data-options="required:true" style="height: "></select></td>
                </tr>
                <tr id="password1">
                    <td>密码:</td>
                    <td><input id="pwd" name="password" type="password" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr id="password2">
                    <td>再次输入:</td>
                    <td><input id="rpwd" name="password1" type="password" class="easyui-validatebox" required="required" validType="equals['#pwd']" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
