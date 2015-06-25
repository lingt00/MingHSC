/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/24 10:38.
 * function:
 */

function loadedIscroll(myScroll,wrapperId,pullDownId,pullUpId, pullDownAction,pullUpAction ){
    var pullDownEl = document.getElementById(pullDownId);
    var pullDownOffset = pullDownEl.offsetHeight;
    var pullUpEl = document.getElementById(pullUpId);
    var pullUpOffset = pullUpEl.offsetHeight;


    myScroll = new iScroll(wrapperId, {
        scrollbarClass: 'myScrollbar', /* 重要样式 */
        useTransition: true, /* 此属性不知用意，本人从true改为false */
        topOffset: pullDownOffset,
        onRefresh: function () {
            if (pullDownEl.className.match('loading')) {
                //pullDownEl.className = '';
                $("#"+pullDownEl.id).removeClass("loading").removeClass("flip");
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
            } else if (pullUpEl.className.match('loading')) {
                pullUpEl.className = '';
                $("#"+pullUpEl.id).removeClass("loading").removeClass("flip");
                pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
            }
        },
        onScrollMove: function () {
//            console.log(this);
            if (this.y > 30 && !pullDownEl.className.match('flip')) {
               // pullDownEl.className = 'flip';
                $("#"+pullDownEl.id).addClass("flip");
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
                this.minScrollY = 0;
            } else if (this.y < 5 && pullDownEl.className.match('flip')) {
               // pullDownEl.className = '';
                $("#"+pullDownEl.id).removeClass("flip").removeClass("loading");
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
                this.minScrollY = -pullDownOffset;
            } else if (this.y < (this.maxScrollY - 30) && !pullUpEl.className.match('flip')) {
                //pullUpEl.className = 'flip';
                $("#"+pullUpEl.id).addClass("flip");
                pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
                this.maxScrollY = this.maxScrollY;
            } else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
                //pullUpEl.className = '';
                $("#"+pullUpEl.id).removeClass("flip").removeClass("loading");
                pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
                this.maxScrollY = pullUpOffset;
            }
        },
        onScrollEnd: function () {
            if (pullDownEl.className.match('flip')) {
                //pullDownEl.className = 'loading';
                $("#"+pullDownEl.id).addClass("loading");
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';
                pullDownAction();	// Execute custom function (ajax call?)
            } else if (pullUpEl.className.match('flip')) {
                //pullUpEl.className = 'loading';
                $("#"+pullUpEl.id).addClass("loading");
                pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';
                pullUpAction();	// Execute custom function (ajax call?)
            }
        }
    });
    setTimeout(function () {
//        document.getElementById(wrapperId).style.left = '0';
//        document.getElementById(wrapperId).style.overflow = 'visible';
    }, 800);

    return myScroll;
}