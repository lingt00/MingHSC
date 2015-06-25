<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>Student-School-Message</title>
    <jsp:include page="/pages/basis/head.jsp"/>
</head>
    <body>
    <div id="Student-School-Message-Detail" data-role="page" data-add-back-btn="true" data-dom-cache="true" data-url="<c:url value="/stujb/hssmsg"/>">
        <div data-role="header" data-position="fixed" data-theme="b" class="container" style="padding:0;">
            <a data-inline="true" data-rel="back"  data-icon="arrow-l" data-mini="true" class="ui-btn ui-btn-left ui-btn-icon-left" href="#">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
            <c:if test="${p!='list'}">
                <a data-inline="true" data-ajax="false" data-icon="bars"   data-mini="true" class="ui-btn ui-btn-right ui-btn-icon-left" data-transition="slide" href="<c:url value="/stujb/msgList"/> ">列表</a>
            </c:if>
        </div>
        <div data-role="content" class="container" style="padding:1px;">

            <div class="content-info-box">
                <div class="info-title-box">
                    为什么小鑫的名字里有三个金呢?
                </div>
                <div class="info-content-box">
                    不像其他的Jq项目，比如jq和jq ui，Jquery Mobile会在加载到增强特性时马上应用它（远早于document.ready事件发生时）。这些特性会基于Jquery Mobile的默认配置应用，是针对默认的情形设计的，他可能符合你的需求，也可能不符合。幸运的是，它很容易设置
                </div>
                <div class="info-attachment-box">
                    <span>附件:</span>
                    <span class="tint"><a href="#" title="点击下载">点击下载</a> </span>
                </div>
                <div class="info-author-box">
                    凌涛
                    <br/>
                    2014-06-18
                </div>
            </div>

            <ul class="content-reply-box" id="content-reply-box-stu">
                <li class="odd">
                    <div class="user" ><img class="img-responsive avatar_" src="<c:url value="/images/p.jpg"/>" alt="" width="45px" height="45px"><span class="user-name">奔波儿灞</span></div>
                    <div class="reply-content-box">
                        <span class="reply-time">03-08 15：00</span>
                        <div class="reply-content pr">
                            <span class="arrow">&nbsp;</span>
                            为什么小鑫的名字里有三个金呢？
                            <img src="http://192.168.1.103/hsc/upload/images/2015516164519-pr1703.jpg" data-ajax="false">
                            <img src="http://192.168.1.103/hsc/upload/images/201551715297-Tulipsr4283.jpg" data-ajax="false">
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

        <script type="text/javascript">
            $(function(){
                var obj = {userUrl:"<c:url value="/images/p.jpg"/>",userName:"小明",createDatetime:"2015-06-19 11:18",content:"老师,今天作业我不会啊@!<img src=\"http://192.168.1.103/hsc/upload/images/2015516164519-pr1703.jpg\" data-ajax=\"false\">"};
                createReplyLi(obj,$("#content-reply-box-stu"))
            });
        </script>

        <div data-role="footer" data-position="fixed" class="container" style="padding:5px;">
            <jsp:include page="/pages/basis/footer-message.jsp"/>
        </div>
    </div>
    </body>
</html>