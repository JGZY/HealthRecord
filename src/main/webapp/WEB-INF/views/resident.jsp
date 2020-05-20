<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/resident.js"></script>
</head>
<body>
    <div id="tb">
            <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>--%>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
            <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>--%>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
            <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
            <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(姓名、账号、电话、户籍、职业、社区)</a>
    </div>
    <table id="dg"></table>

    <div id="dialog">
        <form id="residentForm">
            <input type="hidden" name="id">
            <input type="hidden" name="residentApplyState">
            <table align="center" style="border-spacing: 0 10px">
                <tr>
                    <td>姓名:</td>
                    <td><input type="text" name="residentName" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>账号名:</td>
                    <td><input type="text" name="residentAccount" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>出生日期:</td>
                    <td><input type="text" name="residentBirth" class="easyui-datebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select id="gender" name="residentGender" data-options="required:true"></select></td>
                </tr>
                <tr>
                    <td>身高(厘米):</td>
                    <td><input type="text" name="residentHeight" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>体重(千克):</td>
                    <td><input type="text" name="residentWeight" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>电话号码:</td>
                    <td><input type="text" name="residentPhone" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>居住小区:</td>
                    <td><select id="community" name="residentCommunity.id" data-options="required:true"></select></td>
                </tr>
                <tr>
                    <td>户籍地址:</td>
                    <td><input type="text" name="residentHouse" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
                <tr>
                    <td>职业:</td>
                    <td><input type="text" name="residentWork" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
