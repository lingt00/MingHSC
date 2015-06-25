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
    <script type="text/javascript">

        var myScroll;
        /**
         * 下拉刷新 （自定义实现此方法）
         * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
         */
        function pullDownAction () {
            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
                $("#list>li").remove();

                var el , i;
                el = $("#list");
                for (i=0; i<5; i++) {
                    var li = $("<li>消息"+new Date().getTime()+"</li>");
                    el.append(li);
                }
                $("#list").listview('refresh');
                myScroll.refresh();	 //数据加载完成后，调用界面更新方法   Remember to refresh when contents are loaded (ie: on ajax completion)
            }, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
        }

        /**
         * 滚动翻页 （自定义实现此方法）
         * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
         */
        function pullUpAction () {
            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
                var el , i;
                el = $("#list");
                for (i=0; i<3; i++) {
                    var li = $("<li>消息"+new Date().getTime()+"</a></li>");
                    el.append(li);
                }
                $("#list").listview('refresh');
                myScroll.refresh();		// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
            }, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
        }

        /**
         * 初始化iScroll控件
         */
        function loadedWorkLogList(){
            myScroll = loadedIscroll(myScroll,"wrapper","pullDown","pullUp", pullDownAction,pullUpAction );
        }

        document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
        document.addEventListener('DOMContentLoaded',loadedWorkLogList, false);

    </script>
</head>
    <body>
    <div id="Student-School-List" data-role="page" data-add-back-btn="true" data-url="<c:url value="/stujb/List"/>">
        <div data-role="header" data-position="fixed" data-theme="b" class="container" style="padding:0;">
            <a data-role="button" data-inline="true" data-rel="back"  data-icon="arrow-l" data-mini="true" href="#" class="ui-btn-left ui-btn-icon-left" style="margin-top:-3px;">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
        </div>
        <div role="main" class="container" style="padding:1px 0;">
            <div id="wrapper">
                <div id="scroller">
                    <div id="pullDown" class="row">
                        <span class="col-xs-2 pullDownIcon"></span><span class="col-xs-9 pullDownLabel">下拉刷新...</span>
                    </div>
                    <ul data-role="listview" id="list" style="margin:5px 0;padding:0;">
                        <li>xxxxxxxxxx </li>
                        <li>xxxxxxxxxx </li>
                        <li>xxxxxxxxxx </li>
                        <li>xxxxxxxxxx </li>
                        <li>xxxxxxxxxx </li>
                    </ul>
                    <div id="pullUp" class="row">
                        <span class="col-xs-2 pullUpIcon"></span><span class="col-xs-9 pullUpLabel">上拉加载更多...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>