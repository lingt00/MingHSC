(function($, undefined) {
    $.fn.subpage = function(options) {
        $(document).on("pageshow","#pageIndex",function(){
            $(".nva-panel:eq("+$(".nva-menu .ui-btn-active").parent().index()+")").removeClass("nva-hidden").siblings().addClass("nva-hidden");
        });
    };
    $(document).on("pagecreate create", function(e) {
        $(":jqmData(role='page')", e.target).subpage();
    });
    $(document).bind("mobileinit", function() {
        $.mobile.page.prototype.options.addBackBtn = true;
        $.mobile.page.prototype.options.backBtnText="返回";
//        $.mobile.allowCrossDomainPages = true;
//        $.mobile.page.prototype.options.domCache=true
    });
})(jQuery);
