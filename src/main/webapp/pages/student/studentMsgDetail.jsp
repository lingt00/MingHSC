<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>Student-School-Message</title>
    <jsp:include page="/pages/basis/head.jsp"/>
</head>
    <body>
    <div id="Student-School-Message-Detail" data-role="page" data-add-back-btn="true" data-dom-cache="true" data-url="<c:url value="/student/jb/MsgDetail.do?id=${requestScope.object.id}&studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">
        <div data-role="header" data-position="fixed" data-theme="a" class="container" style="padding:0;">
            <a data-theme="e" data-rel="back"  data-icon="arrow-l" class="ui-btn-left ui-btn-icon-left" href="#">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
            <c:if test="${p!='list'}">
                <a data-theme="e" data-ajax="false" data-icon="bars" class="ui-btn-right ui-btn-icon-left" data-transition="slide" href="<c:url value="/student/jb/msgList.do"/> ">列表</a>
            </c:if>
        </div>
        <div data-role="content" class="container" style="padding:1px;">

            <div class="content-info-box">
                <div class="info-title-box">${requestScope.object.title}</div>
                <div class="info-content-box">${requestScope.object.content}</div>
                <div class="info-attachment-box">
                    <span>附件:</span>
                    <c:forEach items="${requestScope.object.postAttachmentList}" var="postAttachment">
                        <span class="tint" style="margin-right:20px;">${postAttachment.generate}</span>
                    </c:forEach>
                </div>
                <div class="info-author-box">
                    ${requestScope.object.creatorName}
                    <br/>
                    ${requestScope.object.createDatetime}
                </div>
            </div>

            <ul class="content-reply-box" id="content-reply-box-stu">
               <c:forEach items="${requestScope.object.postReplyList}" var="postReply">
                   <%--其他人的评论--%>
                    <c:if test="${empty postReply.studentUser or postReply.studentUser.id!=requestScope.studentUserId}">
                        <li class="odd">
                            <c:if test="${not empty postReply.user}">
                                <div class="user" ><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/>" alt="" width="45px" height="45px"><span class="user-name">${postReply.creatorName}</span></div>
                            </c:if>
                            <c:if test="${not empty postReply.studentUser}">
                                <div class="user" ><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/>" alt="" width="45px" height="45px"><span class="user-name">${postReply.creatorName}</span></div>
                            </c:if>
                            <div class="reply-content-box">
                                <span class="reply-time">${postReply.dateTime}</span>
                                <div class="reply-content pr">
                                    <span class="arrow">&nbsp;</span>
                                   ${postReply.content}
                                </div>
                            </div>
                        </li>
                    </c:if>
                   <%--我的评论--%>
                   <c:if test="${not empty postReply.studentUser and postReply.studentUser.id==requestScope.studentUserId}">
                       <li class="even">
                           <div class="user" ><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/> " alt=""><span class="user-name">${postReply.creatorName}</span></div>
                           <div class="reply-content-box">
                               <span class="reply-time">${postReply.dateTime}</span>
                               <div class="reply-content pr">
                                   <span class="arrow">&nbsp;</span>
                                   ${postReply.content}
                               </div>
                           </div>
                       </li>
                   </c:if>
               </c:forEach>

            </ul>
        </div>

        <script type="text/javascript">
            $(function(){
                <%--var obj = {userUrl:"<c:url value="/images/p.jpg"/>",userName:"小明",createDatetime:"2015-06-19 11:18",content:"老师,今天作业我不会啊@!<img src=\"http://192.168.1.103/hsc/upload/images/2015516164519-pr1703.jpg\" data-ajax=\"false\">"};--%>
                <%--createReplyLi(obj,$("#content-reply-box-stu"))--%>
            });
        </script>

        <div data-role="footer" data-position="fixed" class="container" style="padding:5px;background-color:#E9E9E9;border-color:#E9E9E9;color:#000000;">
            <jsp:include page="/pages/basis/footer-message.jsp"/>
        </div>
    </div>
    </body>
</html>