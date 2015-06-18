<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<html lang="zh-cn">
<head>
    <title><decorator:title/></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <%-- maximum-scale=1.0 与 user-scalable=no 一起使用。这样禁用缩放功能后，用户只能滚动屏幕，就能让您的网站看上去更像原生应用的感觉 --%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="Keywords" content="职业学校管理软件,职业学校管理系统,学历教育管理系统,自考学校管理系统,学历教育管理软件,职业教育管理系统,自考助学机构管理软件"/>
    <meta name="Description" content="明日职业学校管理软件基于科学管理思想设计。全面实现了学员档案管理、出勤管理、收费管理、物资管理、财务管理等软件功能，提升职业学校效率，优化管理。"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/jqm/jquery.mobile-1.4.3.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/jqm/jquery.mobile.theme-1.4.3.min.css"/>">
    <script type="text/javascript" src="<c:url value="/jQuery/commontool/jquery-1.8.3.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/jQuery/jqm/jquery.mobile-1.4.3.min.js"/>"></script>

    <style type="text/css">
    </style>
    <decorator:head />
</head>
<body>
    <decorator:getProperty property="body.id" writeEntireProperty="true"/>
    <decorator:getProperty property="body.class" writeEntireProperty="true"/>
    <decorator:getProperty property="body.style" writeEntireProperty="true"/>
    <decorator:getProperty property="body.scroll" writeEntireProperty="true"/>
    <decorator:getProperty property="body.onunload" writeEntireProperty="true"/>
    <decorator:getProperty property="body.onload" writeEntireProperty="true"/>

    <div data-role="page" data-fullscreen="true" data-theme="a">
        <div data-role="header">
            <h1>欢迎来到我的主页</h1>
        </div>

        <div data-role="content">
            <decorator:body />
        </div>

        <div data-role="footer" data-position="fixed" data-theme="b" data-id="footernav">
            <div data-role="navbar">
                <ul>
                    <li><a class="ui-btn ui-btn-active" data-inline="true" href="<c:url value="/"/> " >首页</a></li>
                    <li><a class="ui-btn" data-inline="true" href="<c:url value="/"/> " >服务</a></li>
                    <li><a class="ui-btn" data-inline="true" href="<c:url value="/"/> " >家庭</a></li>
                </ul>
            </div>
        </div>

    </div>
</body>
</html>