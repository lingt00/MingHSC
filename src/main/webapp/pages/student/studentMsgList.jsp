<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>Student-School-Message-List</title>
    <jsp:include page="/pages/basis/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/sinaface/jquery.sinaEmotion.css"/>">
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

        <input type="hidden" id="studentId" value="${requestScope.studentId}">
        <input type="hidden" id="studentUserId" value="${requestScope.studentUserId}">
        <input type="hidden" id="detailPath" value="<c:url value="/student/jb/MsgDetail.do?p=list"/>">
        <div data-role="header" data-position="fixed" data-position="inline" data-theme="a" class="container">
            <a data-theme="e" data-id="postNav" data-rel="back"  data-icon="arrow-l" class="ui-btn-left ui-btn-icon-left" href="#">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
        </div>
        <div role="main" class="container" style="padding:0;">
            <div id="wrapper">
              <div id="scroller">
                    <div id="pullDown">
                        <span class="col-xs-2 pullDownIcon"></span><span class="col-xs-9 pullDownLabel">下拉刷新...</span>
                    </div>
                    <ul data-role="listview" id="thelist" style="margin:5px 0;padding:0;">
                        <c:forEach items="${requestScope.object}" var="post">
                            <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/student/jb/MsgDetail.do?p=list&id=${post.id}&studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">${post.createDatetime}&nbsp;${post.title}</a></li>
                        </c:forEach>
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