/**
 * Created by lingtao on 15-6-17.
 * commontools
 */
serializeObject = function(form) {
    var o = {};
    $.each(form.serializeArray(), function(index) {
        if (o[this['name']]) {
            o[this['name']] = o[this['name']] + "," + this['value'];
        } else {
            o[this['name']] = this['value'];
        }
    });
    return o;
};


function ajaxCallbackShowLoader(actionUrl,data,fun) {
    if(!actionUrl){
        $.mobile.alert("请先设置请求访问路径");
        return;
    }
    showLoader("请稍后...");
    data = data || {};
    var retrytimes = 5;
    var count = 0;
    var connectServer = function(){
        showLoader("请稍后...");
        $.ajax({
            type: "post",
            url: actionUrl,
            dataType: "jsonp",
            jsonp: "callback",
            contentType: "text/html; charset=utf-8",
            data: data,
            timeout:50000,
            async:true,
            success: function (data) {
                hideLoader();
                fun(data);
               // console.log("success");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                hideLoader();
               // console.log("error:"+XMLHttpRequest+" textStatus:"+textStatus+" errorThrown"+errorThrown);
            },
            complete:function(XMLHttpRequest, textStatus){
              //  console.log("complete:"+XMLHttpRequest+"textStatus:"+textStatus);
                if(textStatus == "timeout"){
                    if(count<retrytimes){
                        count++;
                        connectServer();
                       // console.log(count);
                    }else{
                        showLoader("连接服务器超时！",true);
                    }

                }
            }
        });
    };
    connectServer();
}
function ajaxCallbackShowEle(actionUrl,data,eleObject,fun) {
    if(!actionUrl){
        eleObject.html("请先设置请求访问路径!");
        return;
    }
    eleObject.html("<img src='./jQuery/commontool/ajax-loader.gif' width='20' height='20'>&nbsp;&nbsp;数据加载中,请稍后...");
    data = data || {};
    var retrytimes = 5;
    var count = 0;
    var connectServer = function(){
        $.ajax({
            type: "post",
            //contentType: "text/html; charset=utf-8",
            url: actionUrl,
            data: data,
            async:false,
            dataType: "json",
            timeout:50000,
            success: function (data) {
                fun(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                eleObject.html("error:"+XMLHttpRequest+" textStatus:"+textStatus+" errorThrown:"+errorThrown);
            },
            complete:function(XMLHttpRequest, textStatus){
               // eleObject.html("complete:"+XMLHttpRequest+"textStatus:"+textStatus);
                if(textStatus == "timeout"){
                    if(count<retrytimes){
                        count++;
                        connectServer();
                    }else{
                        eleObject.html("连接服务器超时！",true);
                    }

                }
            }
        });
    };
    connectServer();
}

function ajaxCallback(actionUrl,data,retrytimes,successFun,errorFun) {
    if(!actionUrl){
        $.mobile.alert("亲,世界最远的距离是没有网络!");
        return;
    }
    data = data || {};
    var retryTimes = retrytimes || 5;
    var count = 0;
    var connectServer = function(){
        $.ajax({
            type: "post",
            url: actionUrl,
            data: data,
            async:false,
            dataType: "json",
            timeout:50000,
            success: function (data) {
                successFun(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                errorFun(XMLHttpRequest, textStatus, errorThrown);
            },
            complete:function(XMLHttpRequest, textStatus){
                if(textStatus == "timeout"){
                    if(count<retryTimes){
                        count++;
                        connectServer();
                    }
                }
            }
        });
    };
    connectServer();
}
function ajaxCall(actionUrl,data,msgTitle,type,dataType,contentType,cache,async,fun) {
    if(!actionUrl){
        alert("请先设置请求地址!");
        return;
    }
    async = async || true ;
    cache = cache || true ;
    if(contentType==null||contentType==undefined||contentType=="undefined") contentType = "text/html; charset=utf-8" ;
    showLoader(msgTitle);
    data = data || {};
    var retrytimes = 5;
    var count = 0;
    var connectServer = function(){
        showLoader(msgTitle);
        $.ajax({
            type: type,
            url: actionUrl,
            dataType: dataType,
            contentType: contentType,
            data: data,
            timeout:50000,
            async:async,
            cache:cache,//是否使用缓存
            success: function (data) {
                hideLoader();
                fun(data);
                console.log("success");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                hideLoader();
                console.log("error:"+XMLHttpRequest+" textStatus:"+textStatus+" errorThrown"+errorThrown);
            },
            complete:function(XMLHttpRequest, textStatus){
                console.log("complete:"+XMLHttpRequest+"textStatus:"+textStatus);
                if(textStatus == "timeout"){
                    if(count<retrytimes){
                        count++;
                        connectServer();
                        console.log(count);
                    }else{
                        showLoader("连接服务器超时！",true);
                    }

                }
            }
        });
    };
    connectServer();
}