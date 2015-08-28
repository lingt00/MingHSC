/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/24 14:57.
 * function:
 */

var myScroll ;
var pageInfo = {currentPage:1,pageSize:10};
dwr.engine.setAsync(false);
var url = WebService.getWebServiceUrl('student.attendanceList');
/**
 * 下拉刷新 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
function pullDownAction () {
    $("#theList").html("");
    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
        pageInfo.currentPage = 1 ;
        var studentUserId = $("#studentUserId").val();
        var studentId = $("#studentId").val();
        var urlData = {'studentId':studentId,'studentUserId':studentUserId,'currentPage':pageInfo.currentPage,'pageSize':pageInfo.pageSize};
        var detailPath = $("#detailPath").val();
        ajaxCallback(url,urlData,2,function(dataList){
            if(dataList!=null && dataList!="504"){
                var el =  $("#theList");
                for(var index in dataList){
                    var data = dataList[index];
                    var p1 = "<p>"+data.clazzInstance.course.name+"&nbsp;"+data.clazzInstance.name+"&nbsp;&nbsp;"+data.dateTime+"&nbsp;"+data.student.name+"&nbsp;考勤成功("+data.status+")。</p>";
                    var p2 = "<p>消耗课时:"+data.teachHour+"H,剩余课时:"+data.message+"H.</p>";
                    var li = $("<div class=\"liDiv\">"+p1+p2+"</div>");
                    el.append(li);
                }
                //$("#theList").listview('refresh');
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
        ajaxCallback(url,urlData,2,function(dataList){
            if(dataList!=null && dataList!="504"){
                var el =  $("#theList");
                for(var index in dataList){
                    var data = dataList[index];
                    var p1 = "<p>"+data.clazzInstance.course.name+"&nbsp;"+data.clazzInstance.name+"&nbsp;&nbsp;"+data.dateTime+"&nbsp;"+data.student.name+"&nbsp;考勤成功("+data.status+")。</p>";
                    var p2 = "<p>消耗课时:"+data.teachHour+"H,剩余课时:"+data.message+"H.</p>";
                    var li = $(p1+p2);
                    el.append(li);
                }
                //$("#thelist").listview('refresh');
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
function loadedList(){
    myScroll = loadedIscroll(myScroll,"wrapper","pullDown","pullUp", pullDownAction,pullUpAction );
    if(pageInfo.currentPage==0){
        pullUpAction();
    }
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded',loadedList, false);