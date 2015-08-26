/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/24 14:57.
 * function:
 */

var myScroll ;
var pageInfo = {currentPage:1,pageSize:10};
dwr.engine.setAsync(false);
var url = WebService.getWebServiceUrl('student.postList');
/**
 * 下拉刷新 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
function pullDownAction () {
    $("#thelist>li").remove();
    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
        pageInfo.currentPage = 1 ;
        var studentUserId = $("#studentUserId").val();
        var studentId = $("#studentId").val();
        var urlData = {'studentId':studentId,'studentUserId':studentUserId,'currentPage':pageInfo.currentPage,'pageSize':pageInfo.pageSize};
        var detailPath = $("#detailPath").val();
        ajaxCallback(url,urlData,2,function(data){
            if(data!=null && data!="504"){
                var el =  $("#thelist");
                for(var index in data){
                    var post = data[index];
                    var aLink = detailPath + "&id="+post.id+"&studentId="+studentId+"&studentUserId="+studentUserId ;
                    var li = $("<li><a data-ajax=\"true\" data-transition=\"slide\"  class=\"ui-btn ui-icon-bullets ui-btn-icon-right\" href=\""+aLink+"\">"+post.createDatetime+"&nbsp;"+post.title+"</a></li>");
                    el.append(li);
                }
                $("#thelist").listview('refresh');
            }else{
                document.getElementById("pullDown").querySelector('.pullDownLabel').innerHTML = '已经刷新过啦!';
            }
            myScroll.refresh();	// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
        },function(XMLHttpRequest, textStatus, errorThrown){

        });
    }, 10);	// <-- Simulate network congestion, remove setTimeout from production!
}

/**
 * 滚动翻页 （自定义实现此方法）
 * myScroll.refresh();		数据加载完成后，调用界面更新方法
 */
function pullUpAction () {
    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
        pageInfo.currentPage = pageInfo.currentPage+1 ;
        var studentUserId = $("#studentUserId").val();
        var studentId = $("#studentId").val();
        var urlData = {'studentId':studentId,'studentUserId':studentUserId,'currentPage':pageInfo.currentPage,'pageSize':pageInfo.pageSize};
        var detailPath = $("#detailPath").val();
        ajaxCallback(url,urlData,2,function(data){
            if(data!=null && data!="504"){
                var el =  $("#thelist");
                for(var index in data){
                    var post = data[index];
                    var aLink = detailPath + "&id="+post.id+"&studentId="+studentId+"&studentUserId="+studentUserId ;
                    var li = $("<li><a data-ajax=\"true\" data-transition=\"slide\"  class=\"ui-btn ui-icon-bullets ui-btn-icon-right\" href=\""+aLink+"\">"+post.createDatetime+"&nbsp;"+post.title+"</a></li>");
                    el.append(li);
                }
                $("#thelist").listview('refresh');
            }else{
                document.getElementById("pullUp").className="";
                document.getElementById("pullUp").querySelector('.pullUpLabel').innerHTML = '已经加载到底啦!请向下拉进行刷新...';
            }
            myScroll.refresh();	// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
        },function(XMLHttpRequest, textStatus, errorThrown){

        });

    }, 10);	// <-- Simulate network congestion, remove setTimeout from production!
}
/**
 * 初始化iScroll控件
 */
function loadedStuMsgList(){
    myScroll = loadedIscroll(myScroll,"wrapper","pullDown","pullUp", pullDownAction,pullUpAction );
    if(pageInfo.currentPage==0){
        pullUpAction();
    }
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded',loadedStuMsgList, false);