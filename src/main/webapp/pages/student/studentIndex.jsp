<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html lang="zh-cn">
<head>
    <base href="<%=basePath%>">
    <title>明日博·家校通</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <%-- maximum-scale=1.0 与 user-scalable=no 一起使用。这样禁用缩放功能后，用户只能滚动屏幕，就能让您的网站看上去更像原生应用的感觉 --%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="Keywords" content="职业学校管理软件,职业学校管理系统,学历教育管理系统,自考学校管理系统,学历教育管理软件,职业教育管理系统,自考助学机构管理软件"/>
    <meta name="Description" content="明日职业学校管理软件基于科学管理思想设计。全面实现了学员档案管理、出勤管理、收费管理、物资管理、财务管理等软件功能，提升职业学校效率，优化管理。"/>

    <jsp:include page="/pages/basis/head.jsp"/>

    <style type="text/css">
        .unit_row{ margin:20px auto auto auto;text-align: center;}
        .unit_row .unit{display: inline-block; height:120px; width: 120px; margin: 2px 10px 2px 10px; line-height: 100px;font-size: 18px;color:#FFF;background-color: #CCC1DA;color:#000;}
        input[type=radio]{margin: -8px 0 0 0;}
    </style>
    <script type="text/javascript">
        $(function(){
            $(".nva-menu a").click(function(){
                $(".nva-panel:eq("+$(this).parent().index()+")").removeClass("nva-hidden").siblings().addClass("nva-hidden");
            });
        });

        function onLoading(){
            var student = $("input[name='student']:checked");
            var studentId = student.val();
            var studentUserId = student.attr("id");
            var weChatId = student.attr("weChatId");
            console.log(studentId+","+studentUserId+","+weChatId);

            dwr.engine.setAsync(false);
            //01.加载当前最新消息
            var url1 = WebService.getWebServiceUrl('student.newPost');
            var data1 = {'studentId':studentId,'studentUserId':studentUserId};
            ajaxCallbackShowEle(url1,data1,$("#first-01"),function(data){
                console.log(data);
                var ele = $("#first-01");
                var params = data.id +"&studentId="+studentId+"&studentUserId="+studentUserId;
                var a1 = "<a role=\"button\" data-ajax=\"false\" class=\"btn btn-info btn-xs\" style=\"font-size:10px;\" href=\"<c:url value="/student/jb/MsgDetail.do?id="/>"+params+"\">详情</a>";
                ele.html(data.content+a1+"<br>"+data.createDatetime+"<br>"+data.creatorName);
            });
        }
    </script>
</head>
<body onload="onLoading()">
    <div id="pageIndex" data-role="page">
        <div data-role="header" data-position="fixed" data-position="inline" data-theme="a" class="container">
            <h1 class="ui-title">明日博·家校通</h1>
            <c:if test="${requestScope.length>1}">
                <a href="#pageTwo" data-icon="refresh" data-theme="e" data-rel="dialog" class="ui-btn-right" id="changStudent">切换学生</a>
            </c:if>
        </div>

        <div role="main" class="ui-content" class="container">
            <div class="nva-panel nva-hidden container content-first">
                <div class="panel panel-default">
                    <div class="panel-heading">最新信息</div>
                    <div class="panel-body">
                        <p id="first-01">第1题做得很好；第2题在XX知识点存在理解不到之处，请。。。<a role="button" data-ajax="false" class="btn btn-info btn-xs" style="font-size:10px;" href="<c:url value="/student/jb/MsgDetail.do"/>">详情</a></p>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">出勤</div>
                    <div class="panel-body">
                        <p id="first-02"><a role="button" class="btn btn-info btn-xs" style="font-size:10px;" href="<c:url value="/student/jb/MsgDetail.do"/>">详情</a></p>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">公告</div>
                    <div class="panel-body">
                        <p id="first-03"><a role="button" class="btn btn-info btn-xs" style="font-size:10px;" href="<c:url value="/student/jb/MsgDetail.do"/>">详情</a></p>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">系统消息</div>
                    <div class="panel-body">
                        <p id="first-04"><a role="button" class="btn btn-info btn-xs" style="font-size:10px;" href="<c:url value="/student/jb/MsgDetail.do"/>">详情</a></p>
                    </div>
                </div>
            </div>

            <div class="nva-panel nva-hidden container content-second main_menu">
                <div class="unit_row">
                    <a class="unit ui-btn" href="#pageTwo">学员日志</a>
                    <a class="unit ui-btn" href="#pageTwo">我的课表</a>
                </div>
                <div class="unit_row">
                    <a class="unit ui-btn" href="#pageTwo">我的账单</a>
                    <a class="unit ui-btn" href="#pageTwo">学费消耗</a>
                </div>
            </div>

            <div class="nva-panel nva-hidden container" style="padding-left:0;padding-right:0;">
                <ul data-role="listview" data-inset="true" style="margin-top:20px"  data-split-icon="arrow-r" data-split-theme="d">
                    <li data-role="list-divider">我家Bady</li>
                    <li><a href="#pageTwo">李珊珊<span class="ui-li-aside">女,生日:09-02</span></a> <a href="#pageTwo">详细</a> </li>
                    <li><a href="#pageTwo">李鑫鑫<span class="ui-li-aside">男,生日:09-02</span></a> <a href="#pageTwo">详细</a> </li>
                    <%--<li><a data-role="button" href="#pageTwo" style="text-align:center;">新增</a></li>--%>
                </ul>
                <ul data-role="listview" data-inset="true" style="margin-top:20px" data-split-icon="arrow-r" data-split-theme="d">
                    <li data-role="list-divider">联系方式</li>
                    <li><a href="#pageTwo">爸爸：<span>18961433121</span></a> <a href="#pageTwo">详细</a></li>
                    <li><a href="#pageTwo">妈妈：<span>15235432222</span></a> <a href="#pageTwo">详细</a></li>
                    <%--<li><a data-role="button" href="#pageTwo" style="text-align:center;">添加联系方式</a></li>--%>
                </ul>
            </div>

        </div>

        <div data-role="footer" data-position="fixed"  style="padding-left:0;padding-right:0;background-color:#E9E9E9;border-color:#E9E9E9;" class="container">
           <div data-role="navbar">
                <ul class="operating row text-center linear-g nva-menu">
                    <li class="col-xs-4"><a href="#" id="menu-btn-0" class="ui-btn-active">首页</a></li>
                    <li class="col-xs-4"><a href="#" id="menu-btn-1" >服务</a></li>
                    <li class="col-xs-4"><a href="#" id="menu-btn-2" >家庭</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="pageTwo" data-role="page" data-close-btn="none"  data-overlay-theme="b" data-theme="a">
        <div data-role="header"   data-theme="a">
            <h1>请选择要查看的学生</h1>
        </div>

        <div data-role="content" >
            <fieldset data-role="controlgroup">
                <c:forEach items="${requestScope.objectList}" var="object" varStatus="var">
                    <label for="${object.studentUserId}">${object.studentName}</label>
                    <input type="radio" name="student" id="${object.studentUserId}" value="${object.studentId}" weChatId="${object.weChatId}" <c:if test="${var.index==0}">checked</c:if> />
                </c:forEach>
            </fieldset>
            <a href="#pageIndex" data-role="button" data-rel="back" data-theme="e" onclick="onLoading()">确定</a>
            <a href="#pageIndex" data-role="button" data-rel="back" data-theme="a">取消</a>
        </div>
    </div>
</body>
</html>