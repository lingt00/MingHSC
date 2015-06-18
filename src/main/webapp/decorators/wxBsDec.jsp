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

    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/bootstrap/css/bootstrap.min.css"/>">
    <script type="text/javascript" src="<c:url value="/jQuery/commontool/jquery-1.8.3.min.js"/>"></script>
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

    <div class="container" style="border: 1px solid red;">
        <decorator:body />
    </div>
     <nav class="navbar navbar-default navbar-fixed-bottom container" role="navigation">
        <div>
             <ul class="nav navbar-nav nav-pills ">
                 <li><a href="#">首页</a></li>
                 <li><a href="#">服务</a></li>
                 <li><a href="#">家庭</a></li>
             </ul>
        </div>
     </nav>
<script type="text/javascript" src="<c:url value="/jQuery/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>