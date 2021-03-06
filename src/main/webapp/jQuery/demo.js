(function($,undefined) {
    $(document).on("pagecreate create", function(e) {
        $(":jqmData(role='page')", e.target).subpage();
    });
    $(document).bind("mobileinit", function() {
        $.mobile.page.prototype.options.addBackBtn = true;
        $.mobile.page.prototype.options.backBtnText="返回";
//        $.mobile.allowCrossDomainPages = true;//跨域访问
//        $.mobile.page.prototype.options.domCache=true
    });
    $(document).on("pageload",function(event,data){
//        console.log("pageId:"+data.page[0].id);
//        var pageId = data.page[0].id ;
//        if(pageId == "Student-School-Message-List"){
//            console.log("添加监听器");
//            document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
//            document.addEventListener('DOMContentLoaded',loadedStuMsgList, false);
//        }
    });

    $(document).on("pagebeforechange",function(event){
//            $.getScript("http://localhost/hsc/jQuery/iscrollStuMsg.js",function(){
//                console.log("pagebeforechange事件,加载js成功");
//            });
    });

    $(document).on("pageinit",function(event){
        //console.log("pageinit事件id:"+event.target.id);
        //var pageId = event.target.id ;
        //if(pageId == "Student-School-Message-List"){
        //    console.log("pageinit事件,添加监听器");
        //    document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
        //    document.addEventListener('DOMContentLoaded',loadedStuMsgList, false);
        //    $.getScript("http://localhost/hsc/jQuery/iscrollStuMsg.js",function(){
        //        console.log("pagebeforechange事件,加载js成功");
        //    });
        //}
    });

    $.fn.subpage = function(options) {
        $(document).on("pagebeforechange",function(){
            var forword = $.mobile.navigate.history.getNext();
            //console.log("stack:"+$.mobile.navigate.history.stack.length);
            if (forword) {
                //console.log(forword);
                var dataUrl = forword.url;
                var forwordPage=$.mobile.pageContainer.children(":jqmData(url='" + dataUrl + "')");
                //console.log(forwordPage);
                if(forwordPage){
                    forwordPage.remove();
                }
            }
            $.mobile.navigate.history.clearForward();
        });

        $(document).on("pageshow","#pageIndex",function(){
            if( $(".nva-menu .ui-btn-active").length>0) {
                $(".nva-panel:eq(" + $(".nva-menu .ui-btn-active").parent().index() + ")").removeClass("nva-hidden").siblings().addClass("nva-hidden");
            }else{
                $(".nva-panel:eq("+$(".nva-menu .menu-active").parent().index()+")").removeClass("nva-hidden").siblings().addClass("nva-hidden");
            }
            $(".nva-menu .menu-active").addClass("ui-btn-active");
            $(".nva-menu .ui-btn-active").removeClass("menu-active");
        });
        $(document).on("pagehide","#pageIndex",function(){
            $(".nva-menu .ui-btn-active").addClass("menu-active");
        });

        $(document).on("pageshow","#Student-School-Message-List",function(){
            //console.log("显示页面");
            //document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
            //document.addEventListener('DOMContentLoaded',loadedStuMsgList, false);
        });
        $(document).on("pagehide","#Student-School-Message-List",function(){
            //console.log("隐藏页面");
            //document.removeEventListener('touchmove', function (e) { e.preventDefault(); });
            //document.removeEventListener('DOMContentLoaded',loadedStuMsgList);
        });
    };
})(jQuery);
