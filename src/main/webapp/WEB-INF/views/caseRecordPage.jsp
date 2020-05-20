<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/3/27
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/static/common/common.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/caseRecord.js"></script>
    <style>
        .datagrid-cell{
            white-space:normal;
            word-break:break-all
        }
    </style>
</head>
<body>

<div id="excelUpload">
    <%--上传method必须是post--%>
    <form method="post" enctype="multipart/form-data" id="uploadForm">
        <table>
            <tr>
                <td><input type="file" name="excel" style="width: 180px;margin-top: 20px;margin-left: 10px"></td>
            </tr>
        </table>
    </form>
</div>

<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
    <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>--%>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
    <input type="text" name="keyword" style="width: 150px;height: 33px;padding-left: 5px"/>
    <a class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询(姓名、账号、医院)</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-redo" id="excelOut">导出</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-back" id="excelIn">导入</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="downloadTml">下载模板</a>
</div>
<table id="dg">

</table>

<div id="dialog">
    <form id="caseRecordForm">
        <input type="hidden" name="id">
        <table align="center" style="border-spacing: 0 10px">
            <tr>
                <td>居民账号:</td>
                <td><input type="text" name="resident.residentAccount" class="easyui-validatebox" data-options="required:true" style="width: 172px"/></td>
            </tr>
            <tr>
                <td>医院:</td>
                <td><input name="hospital" class="easyui-validatebox" data-options="required:true" style="width: 172px"/></td>
            </tr>
            <tr>
                <td>科室:</td>
                <td><input type="text" name="dept" class="easyui-validatebox" data-options="required:true" style="width: 172px"/></td>
            </tr>
            <tr>
                <td>病历号:</td>
                <td><input type="text" name="code" class="easyui-validatebox" data-options="required:true" style="width: 172px"/></td>
            </tr>
            <tr>
                <td>主诉:</td>
                <td><textarea name="complain" class="easyui-validatebox" data-options="required:true"></textarea></td>
            </tr>
            <tr>
                <td>病史:</td>
                <td><textarea name="history" class="easyui-validatebox" data-options="required:true"></textarea></td>
            </tr>
            <tr>
                <td>诊断:</td>
                <td><textarea name="diagnose" class="easyui-validatebox" data-options="required:true"></textarea></td>
            </tr>
            <tr>
                <td>意见:</td>
                <td><textarea name="view" class="easyui-validatebox" data-options="required:true"></textarea></td>
            </tr>
            <tr>
                <td>初诊/复诊:</td>
                <td><select id="status" name="status" class="easyui-validatebox" data-options="required:true" placeholder="请选择类型"></select></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
