<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/3/26
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/healthRecord.js"></script>
    <style>
        .combo-panel{
            height: 48px;
        }
        .datagrid-cell{
            white-space:normal;
            word-break:break-all
        }
    </style>
</head>
<body>
<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
    <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
    <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(姓名、账号、疫苗信息)</a>
</div>
<table id="dg">

</table>
<div id="dialog">
    <form id="healthForm">
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
                <td>社区:</td>
                <td><select id="community" name="community.id" data-options="required:true"></select></td>
            </tr>
            <tr>
                <td>高血压:</td>
                <td><select id="highBlood" name="highBlood" data-options="required:true"></select></td>
            </tr>
            <tr>
                <td>新型冠状病毒:</td>
                <td><select id="covid" name="covid" class="easyui-validatebox" data-options="required:true" ></select></td>
            </tr>
            <tr>
                <td>家族遗传病:</td>
                <td><input type="text" name="familyIllness" class="easyui-validatebox" data-options="required:true" /></td>
            </tr>
            <tr>
                <td>血型:</td>
                <td><input type="text" name="bloodType" class="easyui-validatebox" data-options="required:true" /></td>
            </tr>
            <tr>
                <td>色盲:</td>
                <td><input type="text" name="colorBlind" class="easyui-validatebox" data-options="required:true" /></td>
            </tr>
            <tr>
                <td>血糖:</td>
                <td><input type="text" name="bloodSugar" class="easyui-validatebox" data-options="required:true" /></td>
            </tr>
            <tr>
                <td>白血病:</td>
                <td><select id="whiteBlood" name="whiteBlood" class="easyui-validatebox" data-options="required:true"></select></td>
            </tr>
            <tr>
                <td>疫苗信息:</td>
                <td><textarea id="vaccin" name="vaccin" class="easyui-validatebox" data-options="required:true" style="width: 155px"></textarea></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><textarea id="remark" name="remark" class="easyui-validatebox" data-options="required:false" style="width: 155px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
