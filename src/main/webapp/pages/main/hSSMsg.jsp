<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>h-Student-School-Message</title>
    <jsp:include page="/pages/basis/head.jsp"/>
</head>
    <body>
    <div id="h-Student-School-Message" data-role="page" data-add-back-btn="true" >
        <div data-role="header" data-id="headNva" data-position="fixed" data-theme="b" class="container" style="padding:0;">
            <a data-role="button" data-inline="true" data-rel="back" data-icon="arrow-l" data-mini="true" href="#" class="ui-btn-left" style="margin-top:-3px;">返回</a>
            <h1>明日博·家校通</h1>
        </div>

        <div data-role="content" class="container" style="padding:1px;">
            <h1>学生老师交流信息</h1>

            <ul class="content-reply-box">
                <li class="odd">
                    <div class="user" ><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/>" alt=""><span class="user-name">奔波儿灞</span></div>
                    <div class="reply-content-box">
                        <span class="reply-time">03-08 15：00</span>
                        <div class="reply-content pr">
                            <span class="arrow">&nbsp;</span>
                            为什么小鑫的名字里有三个金呢？
                        </div>
                    </div>
                </li>
                <li class="even">
                    <div class="user" ><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/> " alt=""><span class="user-name">灞波儿奔</span></div>
                    <div class="reply-content-box">
                        <span class="reply-time">03-08 15：10</span>
                        <div class="reply-content pr">
                            <span class="arrow">&nbsp;</span>
                            他命里缺金，所以取名叫鑫，有些人命里缺水，就取名叫淼，还有些人命里缺木就叫森。
                        </div>
                    </div>
                </li>
                <li class="even">
                    <div class="user"><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/> " alt=""><span class="user-name">灞波儿奔</span></div>
                    <div class="reply-content-box">
                        <span class="reply-time">03-08 15：10</span>
                        <div class="reply-content pr">
                            <span class="arrow">&nbsp;</span>
                            他命里缺金，所以取名叫鑫，有些人命里缺水，就取名叫淼，还有些人命里缺木就叫森。
                        </div>
                    </div>
                </li>

            </ul>
        </div>

        <div data-role="footer" data-position="fixed" class="container" style="padding:5px;">
            <jsp:include page="/pages/basis/footer-message.jsp"/>
        </div>
    </div>
    </body>
</html>