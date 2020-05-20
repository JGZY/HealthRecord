<%--
  Created by IntelliJ IDEA.
  User: 17921
  Date: 2020/1/19
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账户注册 | 居民健康档案</title>
    <%--<%@include file="/static/common/common.jsp"%>--%>
    <link href="./static/css/base.css" rel="stylesheet">
    <link href="./static/css/register.css" rel="stylesheet">
    <link rel="shortcut icon" href="./static/favicon.ico" type="image/x-icon"/>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome.css" rel="stylesheet">
    <link href="/static/css/animate.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/register.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/static/plugins/easyui/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/content.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/register.js"></script>
</head>
<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>[ 居民健康档案管理系统 ]</h1>
                </div>
                <div class="m-b"></div>
                <h4>
                    欢迎进入 <strong> 居民健康档案注册页面</strong>
                </h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        姓名必须为汉字
                    </li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        账号名必须为英文字符
                    </li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        所有数据必须填入
                    </li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        发送注册申请后，请等待管理员审核
                    </li>
                    <%--<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        申请结果会发送至您的手机信息中
                    </li>--%>
                </ul>
                <div class=" tooltip-demo ">
                    <strong>
                        <a href="${pageContext.request.contextPath}/login.jsp" style="color:#3c3a39;margin-left:15px;">登陆页面&raquo;</a>
                    </strong>

                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <form id="registerForm" action="#" method="post">
                <h3 class="no-margins">社区居民注册</h3>
                <p class="m-t-md">注册登录访问 居民健康档案管理系统</p>
                <input type="text" name="residentName" class="form-control uname" style="height: 25px" placeholder="姓名"/>
                <input type="text" name="residentAccount" class="form-control uname" style="height: 25px"  placeholder="账号名"/>
                <input type="password" name="residentPassword" class="form-control pword m-b" style="height: 25px"  placeholder="密码"/>
                <input type="text" name="residentPhone" class="form-control uname m-b" style="height: 25px;color: black"  placeholder="电话号码"/>
                <select id="residentCommunity" class="form-control" name="residentCommunity.id" style="height: 30px;color: black ;padding: 4px 12px;">
                    <option value="" disabled selected hidden style="color: gray">--选择社区--</option>
                </select>
                <button type="button" id="registerBtn" class="btn btn-success btn-block">注册</button>
            </form>
        </div>
</div>
<div class="signup-footer">
    <div >
        <strong>&copy; 安徽中医药大学 医药信息工程学院</strong>
    </div>
</div>
</div>
<div class="gohome" style="display:none"></div>
</body>
</html>
