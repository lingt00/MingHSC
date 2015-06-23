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
    </style>
    <script type="text/javascript">
        $(function(){
            $(".nva-menu a").click(function(){
                $(".nva-panel:eq("+$(this).parent().index()+")").removeClass("nva-hidden").siblings().addClass("nva-hidden");
            });
            $("td.td-btn").click(function(){
                $(this).parent("tr").children("td:eq("+($(this).index()+1)+")").children("a").click();
            });
        });
    </script>
</head>
<body>
    <div id="pageIndex" data-role="page" data-add-back-btn="true" >
        <div data-role="header" data-position="fixed" data-theme="b" class="container">
            <h1 class="ui-title">明日博·家校通</h1>
        </div>

        <div role="main" class="ui-content">
            <div class="nva-panel nva-hidden container content-first " style="padding-left:0;padding-right:0;margin-top:20px;">
                <table class="table table-bordered table-hover">
                    <tbody>
                    <tr>
                        <td style="width:80px;">王老师</td>
                        <td class="td-btn">第1题做得很好；第2题在XX知识点存在理解不到之处，请。。。</td>
                        <td style="display: none;"><a data-role="button" data-ajax="true" data-inline="true" data-transition="slide" href="<c:url value="/jb/hssmsg"/>">详细</a> </td>
                    </tr>
                    <tr>
                        <td>出勤</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>公告</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>消息</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="nva-panel nva-hidden container content-second main_menu">
                <div class="unit_row">
                    <a class="unit ui-btn" href="#pageTwo">学习日志</a>
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
                    <li><a data-role="button" href="#pageTwo" style="text-align:center;">新增</a></li>
                </ul>
                <ul data-role="listview" data-inset="true" style="margin-top:20px" data-split-icon="arrow-r" data-split-theme="d">
                    <li data-role="list-divider">联系方式</li>
                    <li><a href="#pageTwo">爸爸：<span>18961433121</span></a> <a href="#pageTwo">详细</a></li>
                    <li><a href="#pageTwo">妈妈：<span>15235432222</span></a> <a href="#pageTwo">详细</a></li>
                    <li><a data-role="button" href="#pageTwo" style="text-align:center;">添加联系方式</a></li>
                </ul>
            </div>

        </div>

        <div data-role="footer" data-position="fixed" class="container" style="padding-left:0;padding-right:0;">
           <div data-role="navbar">
                <ul class="operating row text-center linear-g nva-menu">
                    <li class="col-xs-4"><a href="#" id="menu-btn-0" class="ui-btn-active">首页</a></li>
                    <li class="col-xs-4"><a href="#" id="menu-btn-1" >服务</a></li>
                    <li class="col-xs-4"><a href="#" id="menu-btn-2" >家庭</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="pageTwo" data-role="page" data-theme="a" data-add-back-btn="true">
        <div data-role="header"  class="container">
            <h1>明日博·家校通</h1>
        </div>

        <div data-role="content" class="container">
              <h1>内容</h1>
        </div>

        <div data-role="footer" data-position="fixed"  class="container" style="padding-left:0;padding-right:0;">
           页尾
        </div>
    </div>
</body>
</html>