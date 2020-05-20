<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>居民健康档案管理信息系统</title>
    <link href="./static/css/base.css" rel="stylesheet">
    <link href="./static/css/login.css" rel="stylesheet">
    <link rel="shortcut icon" href="./static/favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
</head>
<body class="white">
<div class="login-hd">
    <div class="left-bg"></div>
    <div class="right-bg"></div>
    <div class="hd-inner">
        <span class="logo"></span>
        <span class="split"></span>
        <span class="sys-name">居民健康档案管理信息系统</span>
    </div>
</div>
<div class="login-bd">
    <div class="bd-inner">
        <div class="inner-wrap">
            <div class="lg-zone">
                <div class="lg-box">
                    <div class="lg-label"><h4>用户登录</h4></div>

                    <form>
                        <div class="lg-username input-item clearfix">
                            <i class="iconfont"></i>
                            <input type="text" name="username" placeholder="请用户名">
                        </div>
                        <div class="lg-password input-item clearfix">
                            <i class="iconfont"></i>
                            <input type="password" name="password"  placeholder="请输入密码">
                        </div>
                        <%--<div class="lg-username input-item clearfix">
                            <i class="iconfont"></i>
                            <select name="rid" id="role" placeholder="请选择登陆角色"></select>
                        </div>--%>
                        <div class="enter">
                            <a href="javascript:" class="purchaser" id="loginBtn">点击登录</a>
                            <a href="javascript:" class="supplier" id="registerBtn">点击注册</a>
                        </div>

                    </form>
                    <div class="line line-y"></div>
                    <div class="line line-g"></div>
                </div>
            </div>
            <div class="lg-poster"></div>
        </div>
    </div>
</div>
<div class="login-ft">
    <div class="ft-inner">
        <div class="about-us">
            <a href="javascript:">关于我们</a>
            <a href="javascript:">服务条款</a>
            <a href="javascript:">联系方式</a>
        </div>
        <div class="other-info">建议使用IE8及以上版本浏览器&nbsp;E-mail：1792130202@qq.com</div>
    </div>
</div>
</body>
</html>
