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

        //全局变量
        var $config= {userInfo:{studentId:'',studentUserId:'',weChatId:''},url:{link1:'wx.second01',link2:'wx.second03',link3:'wx.second3',link4:'wx.second4',link5:'wx.second5',link6:'wx.second6'}} ;
        function loadConfig(){
            var student = $("input[name='student']:checked");
            $config.userInfo.studentId = student.val();
            $config.userInfo.studentUserId = student.attr("id");
            $config.userInfo.weChatId = student.attr("weChatId");
        }
        function loadLink(){
            var params = "<c:url value="/redirect.do"/>?studentId="+ $config.userInfo.studentId+"&studentUserId="+$config.userInfo.studentUserId+"&qm=";
            $("#second01").attr("href", params+$config.url.link1);
            $("#second02").attr("href", params+$config.url.link2);
            $("#second03").attr("href", params+$config.url.link3);
            $("#second04").attr("href", params+$config.url.link4);
            $("#second05").attr("href", params+$config.url.link5);
            $("#second06").attr("href", params+$config.url.link6);
        }
        //加载最新消息
        function loadFirst01(){
            var data1 = {'studentId':$config.userInfo.studentId,'studentUserId':$config.userInfo.studentUserId};
            dwr.engine.setAsync(false);
            var url1 = WebService.getWebServiceUrl('student.newPost');
            ajaxCallbackShowEle(url1,data1,$("#first-01"),function(data){
                var ele = $("#first-01");
                var params = data.id +"&studentId="+$config.userInfo.studentId+"&studentUserId="+$config.userInfo.studentUserId;
                var a1 = "<a role=\"button\" data-ajax=\"false\" class=\"btn btn-info btn-xs\" style=\"font-size:10px;\" href=\"<c:url value="/student/jb/MsgDetail.do?id="/>"+params+"\">详情</a>";
                ele.html(data.content+a1+"<br>"+data.createDatetime+"<br>"+data.creatorName);
            });
        }
        function loadFirst02(){
            var data1 = {'studentId':$config.userInfo.studentId,'studentUserId':$config.userInfo.studentUserId};
            dwr.engine.setAsync(false);
            var url1 = WebService.getWebServiceUrl('student.attendance');
            ajaxCallbackShowEle(url1,data1,$("#first-02"),function(data){
                var ele = $("#first-02");
                var params = "?studentId="+$config.userInfo.studentId+"&studentUserId="+$config.userInfo.studentUserId;
                var a1 = "<a role=\"button\" data-ajax=\"false\" class=\"btn btn-info btn-xs\" style=\"font-size:10px;\" href=\"<c:url value="/student/jb/attendanceList.do"/>"+params+"\">更多</a>";
                var p1 = "<p>["+data.mode+"]&nbsp;"+data.clazzInstance.course.name+"&nbsp;"+data.clazzInstance.name+"&nbsp;&nbsp;"+data.dateTime+"&nbsp;"+data.student.name+"&nbsp;考勤成功("+data.status+")。</p>";
                var p2 = "<p>消耗课时:"+data.teachHour+"H,剩余课时:"+data.message+"H.</p>";
                ele.html(p1+p2+a1);
            });
        }
        function loadFirst03(){
            var data1 = {'studentId':$config.userInfo.studentId,'studentUserId':$config.userInfo.studentUserId};
            dwr.engine.setAsync(false);
            var url1 = WebService.getWebServiceUrl('student.news');
            ajaxCallbackShowEle(url1,data1,$("#first-03"),function(data){
                var ele = $("#first-03");
                var params = "?studentId="+$config.userInfo.studentId+"&studentUserId="+$config.userInfo.studentUserId;
                var a1 = "<a role=\"button\" data-ajax=\"false\" class=\"btn btn-info btn-xs\" style=\"font-size:10px;\" href=\"<c:url value="/student/jb/newsDetail.do"/>"+params+"&id="+data.id+"\">详情</a>";
                var a2 = "<a role=\"button\" data-ajax=\"false\" class=\"btn btn-info btn-xs\" style=\"font-size:10px;\" href=\"<c:url value="/student/jb/newsList.do"/>"+params+"\">更多</a>";
                var p1 = "<h3>"+data.title+"</h3>";
                var p2 = "<h5>"+data.theDatetime+"</h5>";
                var p3 = "<p>"+data.content+a1+"</p>";
                ele.html(p1+p2+p3+a2);
            });
        }
        function loadFirst04(){
            var data1 = {'studentId':$config.userInfo.studentId,'studentUserId':$config.userInfo.studentUserId};
            dwr.engine.setAsync(false);
            var url1 = WebService.getWebServiceUrl('student.sysLogList');
            ajaxCallbackShowEle(url1,data1,$("#first-04"),function(dataList){
                var ele = $("#first-04");
                var p = "";
                for(var idx in dataList){
                    var data = dataList[idx];
                    p += "<p>"+data.message+"</p>";
                }
                ele.html(p);
            });
        }

        function onLoading(){
            loadConfig();
            loadLink();
            loadFirst01();
            loadFirst02();
            loadFirst03();
            loadFirst04();
        }

        function saveOrUpdate(idEle){
            var urlData = $("#"+idEle).serializeArray();
            //student.saveOrUpdate
            dwr.engine.setAsync(false);
            var url1 = WebService.getWebServiceUrl('student.saveOrUpdate');
            ajaxCallback(url1,urlData,2,function(data){
                if(data==200){
                    window.location.reload();
                    return true ;
                }else{
                    return false;
                }
            },function(){
                return false ;
            });
        }
        function closeWin(){
            var userAgent = navigator.userAgent;
            if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Presto") != -1) {
                window.location.replace("about:blank");
            } else {
                window.opener = null;
                window.open("", "_self");
                window.close();
            }
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
                        <p id="first-01"></p>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">出勤</div>
                    <div class="panel-body">
                        <p id="first-02"></p>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">公告</div>
                    <div class="panel-body">
                        <div id="first-03" style="overflow: hidden;"></div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">系统消息</div>
                    <div class="panel-body">
                        <div id="first-04"></div>
                    </div>
                </div>
            </div>

            <div class="nva-panel nva-hidden container content-second main_menu">
                <div class="unit_row">
                    <a class="unit" id="second01" data-ajax="false" href="">学员日志</a>
                    <a class="unit" id="second02" data-ajax="false" href="">班级日志</a>
                </div>
                <div class="unit_row">
                    <a class="unit" id="second03" data-ajax="false" href="">学员作业</a>
                    <a class="unit" id="second04" data-ajax="false" href="">账单记录</a>
                </div>
                <div class="unit_row">
                    <a class="unit" id="second05" data-ajax="false" href="">剩余学时</a>
                    <a class="unit" id="second06" data-ajax="false" href="">我的课表</a>
                </div>
            </div>

            <div class="nva-panel nva-hidden container" style="padding-left:0;padding-right:0;">
                <ul data-role="listview" data-inset="true" style="margin-top:20px"  data-split-icon="arrow-r" data-split-theme="d">
                    <li data-role="list-divider">我家Bady</li>
                    <c:forEach items="${requestScope.objectList}" var="object" varStatus="var">
                        <li>
                            <a href="javascript:void(0);">
                                ${object.studentName}<span class="ui-li-aside"><c:if test="${object.sex==1}">男</c:if><c:if test="${object.sex==2}">女</c:if>&nbsp;&nbsp;<c:if test="${not empty object.birth && object.birth!=''}">生日:${object.birth}</c:if>　</span>
                            </a>
                            <a href="#info-${object.studentId}" data-rel="dialog" data-icon="edit">修改</a>
                        </li>
                    </c:forEach>
                </ul>
                <ul data-role="listview" data-inset="true" style="margin-top:20px" data-split-icon="arrow-r" data-split-theme="d">
                    <li data-role="list-divider">联系方式</li>
                    <c:forEach items="${requestScope.objectList}" var="object">
                        <li>
                            <a href="javascript:void(0);">
                                <h3>${object.studentName}</h3>
                                <p style="font-size: 14px;">联系人1：<span>${object.phone }</span>&nbsp;&nbsp;<span>${object.contactMan}</span></p>
                                <p style="font-size: 14px;">联系人2：<span>${object.phone2}</span>&nbsp;&nbsp;<span>${object.contactMan2}</span></p>
                            </a>
                            <a href="#link-${object.studentId}" data-rel="dialog" data-icon="edit">修改</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>

        <div data-role="footer" data-position="fixed"  style="padding-left:0;padding-right:0;background-color:#E9E9E9;border-color:#E9E9E9;" class="container">
           <div data-role="navbar">
                <ul class="text-center nva-menu">
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
    <c:forEach items="${requestScope.objectList}" var="object">
        <div id="info-${object.studentId}" data-role="dialog" data-close-btn="right"  data-overlay-theme="b" data-theme="a">
            <div data-role="header"   data-theme="a">
                <h1>修改学生信息</h1>
            </div>
            <div data-role="content" >
                <h3>${object.studentName}</h3>
                <form id="info-${object.studentId}-form" >
                    <input type="hidden" name="studentId" value="${object.studentId}">
                    <input type="hidden" name="type" value="info">
                    <fieldset data-role="controlgroup">
                        <legend>生日</legend>
                        <%--<label for="birth-${object.studentId}">生日</label>--%>
                        <input type="date" name="birth" id="birth-${object.studentId}" value="${object.birth}">
                    </fieldset>
                    <fieldset data-role="controlgroup">
                        <legend>性别</legend>
                        <input type="radio" name="sex" id="sex1-${object.studentId}" value="1" <c:if test="${object.sex==1}">checked</c:if> ><label for="sex1-${object.studentId}">男</label>
                        <input type="radio" name="sex" id="sex2-${object.studentId}" value="2" <c:if test="${object.sex==2}">checked</c:if>><label for="sex2-${object.studentId}">女</label>
                    </fieldset>
                </form>
                <a href="javascript:void (0);" data-role="button" data-theme="e" onclick="saveOrUpdate('info-${object.studentId}-form')">确定</a>
                <a href="#pageIndex" data-role="button" data-rel="back" data-theme="a">取消</a>
            </div>
        </div>

        <div id="link-${object.studentId}" data-role="dialog" data-close-btn="right"  data-overlay-theme="b" data-theme="a">
            <div data-role="header"   data-theme="a">
                <h1>修改联系人${object.studentName}</h1>
            </div>
            <div data-role="content" >
                <h3>${object.studentName}</h3>
                <form id="link-${object.studentId}-form" >
                    <input type="hidden" name="studentId" value="${object.studentId}">
                    <input type="hidden" name="type" value="link">
                    <div data-role="fieldcontain">
                        <legend>联系人1</legend>
                        <label for="contactMan-${object.studentId}">身份</label> <input type="text" name="contactMan" id="contactMan-${object.studentId}" value="${object.contactMan}" >
                        <label for="phone-${object.studentId}">电话</label> <input type="phone" name="phone" id="phone-${object.studentId}" value="${object.phone}">
                    </div>
                    <div data-role="fieldcontain">
                        <legend>联系人2</legend>
                        <label for="contactMan2-${object.studentId}">身份</label> <input type="text" name="contactMan2" id="contactMan2-${object.studentId}" value="${object.contactMan2}"/>
                        <label for="phone2-${object.studentId}">电话</label> <input type="phone" name="phone2" id="phone2-${object.studentId}" value="${object.phone2}">
                    </div>

                </form>
                <a href="javascript:void (0);" data-role="button" data-theme="e" onclick="saveOrUpdate('link-${object.studentId}-form')">确定</a>
                <a href="#pageIndex" data-role="button" data-rel="back" data-theme="a">取消</a>
            </div>
        </div>
    </c:forEach>

    <div id="closeWin" data-role="dialog" data-close-btn="none"  data-overlay-theme="b" data-theme="a">
        <div data-role="header"   data-theme="a">
            <h1>反馈结果</h1>
        </div>
        <div data-role="content" >
            <span>学生信息已被更新,请关闭页面重新打开!</span>
        </div>
    </div>
</body>
</html>