/**
 * Created by IntelliJ IDEA
 * User: lingTao on 2015/6/19 9:36.
 * function:本项目常用方法
 */


function refreshDiv(par,child){
    child.appendTo(par).trigger('create');
}

function mScrollTo(id){
    $("html,body").stop(true);
    $("html,body").animate({scrollTop: $("#"+id).offset().top}, 1000);
}

function createReplyLi(obj,ulObj,type){
    var li = $("<li></li>");
   if(type==1){
       li.addClass("even");
   }else{
       li.addClass("odd");
   }
    var user = $("<div class=\"user\" ><img class=\"img-responsive avatar_\" src=\""+obj.userUrl+"\" width=\"45px\" height=\"45px\"><span class=\"user-name\">"+obj.userName+"</span></div>");
    var content = $("<div class=\"reply-content-box\"></div>");
    var contenTime = $("<span class=\"reply-time\">"+obj.createDatetime+"</span>");
    var replyContent = $("<div class=\"reply-content pr\"><span class=\"arrow\">&nbsp;</span></div>");
    li.append(user).append(content.append(contenTime).append(replyContent.append($("<span>"+obj.content+"</span>")))).appendTo(ulObj).trigger('create');
}
