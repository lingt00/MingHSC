<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>Student-School-News-Detail</title>
    <jsp:include page="/pages/basis/head.jsp"/>
</head>
    <body>
    <div id="Student-School-News-Detail" data-role="page" data-add-back-btn="true" data-dom-cache="true" data-url="<c:url value="/student/jb/newsDetail.do?id=${requestScope.object.id}&studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">
        <div data-role="header" data-id="newsNav" data-position="fixed" data-position="inline" data-theme="a" class="container">
            <a data-theme="e" data-rel="back"  data-icon="arrow-l" class="ui-btn-left ui-btn-icon-left" href="#">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
            <c:if test="${p!='list'}">
                <a data-theme="e" data-ajax="false" data-icon="bars" class="ui-btn-right ui-btn-icon-left" data-transition="slide" href="<c:url value="/student/jb/newsList.do?studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">列表</a>
            </c:if>
        </div>
        <div  role="main" class="container ui-content" style="padding:1px;">

            <input type="hidden" id="newsId" value="${requestScope.object.id}">
            <input type="hidden" id="studentId" value="${requestScope.studentId}">
            <input type="hidden" id="studentUserId" value="${requestScope.studentUserId}">
            <input type="hidden" id="userId" value="${requestScope.object.author.id}">

            <div class="content-info-box">
                <div class="info-title-box"><h3>${requestScope.object.title}</h3></div>
                <div class="info-content-box">${requestScope.object.content}</div>
                <div class="info-attachment-box">
                    <span>附件:</span>
                    <c:forEach items="${requestScope.object.newsAttachmentList}" var="postAttachment">
                        <span class="tint" style="margin-right:20px;">${postAttachment.generate}</span>
                    </c:forEach>
                </div>
                <div class="info-author-box">
                    ${requestScope.object.author.name}
                    <br>
                    ${requestScope.object.teachArea.name}
                    <br/>
                    ${requestScope.object.theDatetime}
                </div>
            </div>

        </div>
    </div>
    </body>
</html>