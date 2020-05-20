<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/1/16
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/role.js"></script>
    <style>
        #dialog  #roleForm .panel-header{
            height:25px;
        }
        #dialog  #roleForm .panel-title{
            color: black;
            margin-top: -5px;
        }
    </style>
</head>
<body>
    <div id="tb">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>--%>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
    </div>
    <div id="roleDg"></div>

    <div id="dialog">
        <form id="roleForm">
            <table align="center" style="border-spacing: 20px 30px">
                <input type="hidden" name="rid">
                <tr align="center">
                    <td>角色编号:<input type="text" name="rnum" class="easyui-validatebox"></td>
                    <td>角色名称:<input type="text" name="rname" class="easyui-validatebox"></td>
                </tr>
                <tr>
                    <td><div id="role_data1"></div></td>
                    <td><div id="role_data2"></div></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="pDialog">
        <form id="permissionForm">
            <table id="verifyDialog">
                <tr align="center">
                    <td>权限名称:<input type="text" name="pname" class="easyui-validatebox"></td>
                    <td>资源名称:<input type="text" name="presource" class="easyui-validatebox"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
