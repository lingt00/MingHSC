<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>Student-School-Message-List</title>
    <jsp:include page="/pages/basis/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/iscroll/scrollbar.css"/>">
    <script type="text/javascript" src="<c:url value="/jQuery/iscroll/iscroll.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/jQuery/iscroll/iscrollUtil.js"/>"></script>
    <style type="text/css">
        #pullDown .pullDownIcon, #pullUp .pullUpIcon  {
            background:url(<c:url value="/jQuery/iscroll/pull-icon40.png"/>) 0 0 no-repeat;
        }
    </style>
</head>
    <body>
    <div id="Student-School-Message-List" data-role="page" data-add-back-btn="true" data-url="<c:url value="/student/jb/msgList.do?studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">

        <div data-role="header" data-position="fixed" data-position="inline" data-theme="a" class="container">
            <a data-theme="e" data-rel="back"  data-icon="arrow-l" class="ui-btn-left ui-btn-icon-left" href="#">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
        </div>
        <div role="main" class="container" style="padding:0;margin:0;">
            <div id="wrapper">
              <div id="scroller">
                    <div id="pullDown">
                        <span class="col-xs-2 pullDownIcon"></span><span class="col-xs-9 pullDownLabel">下拉刷新...</span>
                    </div>
                    <ul data-role="listview" id="thelist" style="margin:5px 0;padding:0;">
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢为什么小鑫的名字里有三个金呢为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢为什么小鑫的名字里有三个金呢为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                        <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/stujb/hssmsg"/>?p=list">为什么小鑫的名字里有三个金呢?</a></li>
                    </ul>
                    <div id="pullUp">
                        <span class="col-xs-2 pullUpIcon"></span><span class="col-xs-9 pullUpLabel">上拉加载更多...</span>
                    </div>
              </div>
            </div>
        </div>
        <script type="text/javascript" src="<c:url value="/jQuery/iscrollStuMsg.js"/>"></script>
    </div>
    </body>
</html>