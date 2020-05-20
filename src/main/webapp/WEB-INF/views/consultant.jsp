<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/1/7
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/consultant.js"></script>
</head>
<body>
    <div id="tb">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
        <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
        <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(姓名、账号、电话、社区名)</a>
    </div>
    <table id="dg"></table>

    <div id="dialog">
        <form id="consultantForm">
            <input type="hidden" name="id">
            <table align="center" style="border-spacing: 0 10px">
                <tr>
                    <td>姓名:</td>
                    <td><input type="text" name="consultantName" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>账号名:</td>
                    <td><input type="text" name="consultantAccount" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>年龄:</td>
                    <td><input type="text" name="consultantAge" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>联系方式:</td>
                    <td><input type="text" name="consultantPhone" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select id="gender" name="consultantGender" class="easyui-validatebox" data-options="required:true" placeholder="请选择性别"></select></td>
                </tr>
                <tr>
                    <td>服务社区:</td>
                    <td><select id="community" name="community.id" class="easyui-validatebox" data-options="required:true" placeholder="请选择服务小区"></select></td>
                </tr>
                <tr id="password1">
                    <td>密码:</td>
                    <td><input id="pwd" name="consultantPassword" type="password" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr id="password2">
                    <td>再次输入:</td>
                    <td><input id="rpwd" name="consultantPassword2" type="password" class="easyui-validatebox" required="required" validType="equals['#pwd']" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
