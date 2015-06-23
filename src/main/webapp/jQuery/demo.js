(function($,undefined) {
    $.fn.subpage = function(options) {
        $(document).on("pagebeforechange",function(){
            var forword = $.mobile.navigate.history.getNext();
            console.log("stack:"+$.mobile.navigate.history.stack.length);
            if (forword) {
                console.log(forword);
                var dataUrl = forword.url;
                var forwordPage=$.mobile.pageContainer.children(":jqmData(url='" + dataUrl + "')");
                console.log(forwordPage);
                if(forwordPage){
                    forwordPage.remove();
                }
            }
            $.mobile.navigate.history.clearForward();
        });

        $(document).on("pageshow","#pageIndex",function(){
            $(".nva-panel:eq("+$(".nva-menu .ui-btn-active").parent().index()+")").removeClass("nva-hidden").siblings().addClass("nva-hidden");
        });

//        $(document).on("pagehide","#Student-School-Message-Detail",function(event){
//            console.log(event);
//        })
    };
    $(document).on("pagecreate create", function(e) {
        $(":jqmData(role='page')", e.target).subpage();
    });
    $(document).bind("mobileinit", function() {
        $.mobile.page.prototype.options.addBackBtn = true;
        $.mobile.page.prototype.options.backBtnText="返回";
//        $.mobile.allowCrossDomainPages = true;//跨域访问
//        $.mobile.page.prototype.options.domCache=true
    });
})(jQuery);
