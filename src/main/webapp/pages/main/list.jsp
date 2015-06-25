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
                $("#thelist>li").remove();

                var el , i;
                el = $("#thelist");
                for (i=0; i<3; i++) {
                    var li = $("<li><a data-ajax=\"true\" data-transition=\"slide\"  class=\"ui-btn ui-icon-bullets ui-btn-icon-right\" href=\"/hsc/stujb/hssmsg\">消息"+new Date().getTime()+"</a></li>");
                    el.append(li);
                }
                $("#thelist").listview('refresh');
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
                el = $("#thelist");
                for (i=0; i<3; i++) {
                    var li = $("<li><a data-ajax=\"true\" data-transition=\"slide\"  class=\"ui-btn ui-icon-bullets ui-btn-icon-right\" href=\"/hsc/stujb/hssmsg\">消息?"+new Date().getTime()+"</a></li>");
                    el.append(li);
                }
                $("#thelist").listview('refresh');
                myScroll.refresh();		// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
            }, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
        }

        /**
         * 初始化iScroll控件
         */
        function loadedStuMsgList(){
            myScroll = loadedIscroll(myScroll,"wrapper","pullDown","pullUp", pullDownAction,pullUpAction );
//            console.log(myScroll);
        }

        document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
        document.addEventListener('DOMContentLoaded',loadedStuMsgList, false);

    </script>
</head>
    <body>
    <div id="Student-School-List" data-role="page" data-add-back-btn="true" data-url="<c:url value="/stujb/List"/>">
        <div data-role="header" data-position="fixed" data-theme="b" class="container" style="padding:0;">
            <a data-role="button" data-inline="true" data-rel="back"  data-icon="arrow-l" data-mini="true" href="#" class="ui-btn-left ui-btn-icon-left" style="margin-top:-3px;">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
        </div>
        <div data-role="content" class="container" id="wrapper" style="padding:1px;">
            <div id="scroller">
                <div id="pullDown" class="row">
                    <span class="col-xs-2 pullDownIcon"></span><span class="col-xs-9 pullDownLabel">下拉刷新...</span>
                </div>
                <ul data-role="listview" id="thelist" style="margin:5px 5px;padding:0;">
                    <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="/hsc/stujb/hssmsg">消息 1</a></li>
                    <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="/hsc/stujb/hssmsg">消息 2</a></li>
                    <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="/hsc/stujb/hssmsg">消息 3</a></li>
                    <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="/hsc/stujb/hssmsg">消息 4</a></li>
                    <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="/hsc/stujb/hssmsg">消息 5</a></li>
                </ul>
                <div id="pullUp" class="row">
                    <span class="col-xs-2 pullUpIcon"></span><span class="col-xs-9 pullUpLabel">上拉加载更多...</span>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>