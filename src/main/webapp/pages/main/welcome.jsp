<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title></title>


    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/uploadify/css/uploadify.css"/>">
    <script type="text/javascript" src="<c:url value="/jQuery/uploadify/swf/swfobject.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/jQuery/uploadify/jquery.uploadify.min.js"/>"></script>
</head>
    <body>
       <div class="container">
           <h1>欢迎访问本网站</h1>

           <script type="text/javascript">
               $(function(){
                   $("#file_upload").uploadify({
                       'buttonImage' : '<c:url value="/jQuery/uploadify/img/browse-green.png"/>',
                       'swf': '<c:url value="/jQuery/uploadify/swf/uploadify.swf"/> ',
                       'uploader': '<%=basePath%>upload/img ',
                       'fileTypeDesc': 'Image Files',                 //允许上传的文件格式为*.jpg,*.gif,*.png
                       'fileTypeExts':'*.jpg;*.gif;*.png',  //过滤掉除了*.jpg,*.gif,*.png的文件
                       'queueID': 'fileQueue',
                       'fileSizeLimit': '2MB',                         //最大允许的文件大小为2M
                       'auto': true,                                  //需要手动的提交申请
                       'multi': true,                                 //一次只允许上传一张图片
                       'queueSizeLimit':9,
                       'hideButton':true,
                       'width':70,
                       'height':28,
                       'onUploadSuccess':function(file, data, response){
                           var reStr = "<img src=\"" +data + "\" />";
                           $("#emoInput").append($(reStr));
                       },
                       'onSelectError':function(file, errorCode, errorMsg){
                           switch(errorCode) {
                               case -100:
                                   alert("上传的文件数量已经超出系统限制的"+$('#file_upload').uploadify('settings','queueSizeLimit')+"个文件！");
                                   break;
                               case -110:
                                   alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#file_upload').uploadify('settings','fileSizeLimit')+"大小！");
                                   break;
                               case -120:
                                   alert("文件 ["+file.name+"] 大小异常！");
                                   break;
                               case -130:
                                   alert("文件 ["+file.name+"] 类型不正确！");
                                   break;
                           }
                       },
                       'onFallback':function(){
                           alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                       }
                   });
               });
           </script>
       </div>
    </body>
</html>