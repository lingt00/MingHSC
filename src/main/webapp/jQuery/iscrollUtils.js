/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/24 14:57.
 * function:
 */


/**
 * 下拉刷新 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
function pullDownAction () {
    $("#theList").html("");
    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
        pageInfo.currentPage = 1 ;
        $("#theList").html("");
        loadPageInfo();
    }, 10);	// <-- Simulate network congestion, remove setTimeout from production!
}

/**
 * 滚动翻页 （自定义实现此方法）
 * myScroll.refresh();		数据加载完成后，调用界面更新方法
 */
function pullUpAction () {
    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
        pageInfo.currentPage = pageInfo.currentPage+1 ;
        loadPageInfo();
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

//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
//document.addEventListener('DOMContentLoaded',loadedList, false);