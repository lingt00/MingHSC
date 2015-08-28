<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>Student-School-News-List</title>
    <jsp:include page="/pages/basis/head.jsp"/>
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
    <div id="Student-School-News-List" data-role="page" data-add-back-btn="true" data-url="<c:url value="/student/jb/newsList.do?studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">

        <input type="hidden" id="studentId" value="${requestScope.studentId}">
        <input type="hidden" id="studentUserId" value="${requestScope.studentUserId}">
        <input type="hidden" id="detailPath" value="<c:url value="/student/jb/newsDetail.do?p=list"/>">
        <div data-role="header" data-id="newsNav" data-position="fixed" data-position="inline" data-theme="a" class="container">
            <a data-theme="e" data-rel="back"  data-icon="arrow-l" class="ui-btn-left ui-btn-icon-left" href="#">返回</a>
            <h1 class="ui-title">明日博·家校通</h1>
        </div>
        <div role="main" class="container" style="padding:0;">
            <div id="wrapper">
              <div id="scroller">
                    <div id="pullDown">
                        <span class="col-xs-2 pullDownIcon"></span><span class="col-xs-9 pullDownLabel">下拉刷新...</span>
                    </div>
                  <ul data-role="listview" id="theList" style="margin:5px 0;padding:0;">
                      <c:forEach items="${requestScope.object}" var="data">
                          <li><a data-ajax="true" data-transition="slide"  class="ui-btn ui-icon-bullets ui-btn-icon-right" href="<c:url value="/student/jb/newsDetail.do?p=list&id=${data.id}&studentId=${requestScope.studentId}&studentUserId=${requestScope.studentUserId}"/>">${data.title}&nbsp;${data.theDatetime}</a></li>
                      </c:forEach>
                  </ul>
                    <div id="pullUp">
                        <span class="col-xs-2 pullUpIcon"></span><span class="col-xs-9 pullUpLabel">上拉加载更多...</span>
                    </div>
              </div>
            </div>
        </div>
        <script type="text/javascript">
            var myScroll ;
            var pageInfo = {currentPage:1,pageSize:5};
            dwr.engine.setAsync(false);
            var url = WebService.getWebServiceUrl('student.newsList');

            function loadPageInfo(){
                var studentUserId = $("#studentUserId").val();
                var studentId = $("#studentId").val();
                var urlData = {'studentId':studentId,'studentUserId':studentUserId,'currentPage':pageInfo.currentPage,'pageSize':pageInfo.pageSize};
                var detailPath = $("#detailPath").val();
                ajaxCallback(url,urlData,2,function(dataList){
                    console.log(dataList);
                    if(dataList!=null && dataList!="504"){
                        var el =  $("#theList");
                        for(var index in dataList){
                            var data = dataList[index];

                            var aLink = detailPath + "&id="+data.id+"&studentId="+studentId+"&studentUserId="+studentUserId ;
                            var li = $("<li><a data-ajax=\"true\" data-transition=\"slide\"  class=\"ui-btn ui-icon-bullets ui-btn-icon-right\" href=\""+aLink+"\">"+data.title+"&nbsp;"+data.theDatetime+"</a></li>");

                            el.append(li);
                        }
                        $("#theList").listview('refresh');
                    }else{
                        if(document.getElementById("pullUp").className.match('loading') || document.getElementById("pullUp").className.match('flip')){
                            document.getElementById("pullUp").className="";
                            document.getElementById("pullUp").querySelector('.pullUpLabel').innerHTML = '已经加载到底啦!请向下拉进行刷新...';
                        }else{
                            document.getElementById("pullDown").className="";
                            document.getElementById("pullDown").querySelector('.pullDownLabel').innerHTML = '已经刷新过啦!';
                        }
                    }
                    myScroll.refresh();	// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
                },function(XMLHttpRequest, textStatus, errorThrown){

                });
            }
        </script>
        <script type="text/javascript" src="<c:url value="/jQuery/iscrollUtils.js"/>"></script>
        <script type="text/javascript">
            $(function(){
                document.getElementById("Student-School-News-List").addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
                myScroll = loadedIscroll(myScroll,"wrapper","pullDown","pullUp", pullDownAction,pullUpAction );
                if(pageInfo.currentPage==0){
                    pullUpAction();
                }
                //document.getElementById("Student-School-News-List").addEventListener('DOMContentLoaded',loadedList, false);
            });
        </script>
    </div>
    </body>
</html>