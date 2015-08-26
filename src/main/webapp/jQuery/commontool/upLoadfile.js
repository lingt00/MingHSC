/**
 * Created by lingtao on 15-6-17.
 * upLoadFile
 */

function upLoadImgs( files ,upLoadUrl,fun){
    $.each(files,function(i){
        lrz(this,{
            before: function() {
                showLoader("图片上传中...",false,true);
            },
            fail: function(err) {
                showLoader(err ,true);
            },
            always: function() {
                hideLoader();
            },
            done: function (results) {
                // 你需要的数据都在这里，可以以字符串的形式传送base64给服务端转存为图片。
                    $.ajax({
                        async:false,//是否异步
                        cache:false,//是否使用缓存
                        type: "POST",
                        data:{fileData:results.base64,fileSize:results.base64.length,fileName:results.origin.name,fileType:results.origin.type},
                        dataType: "text",
                        timeout: 1000,
                        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
                        url: upLoadUrl,
                        success: function(result){
                            fun(result);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            hideLoader();
                        },
                        complete:function(XMLHttpRequest, textStatus){
                            if(textStatus == "timeout"){
                                showLoader("连接服务器超时！",true);
                            }
                        }
                    });
            }
        });
    });
}