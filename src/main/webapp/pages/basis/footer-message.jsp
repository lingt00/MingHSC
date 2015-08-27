<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input id="fileUploadPath" value="<%=(request.getScheme()+"://"+request.getServerName()+(request.getServerPort()==80?"":(":"+request.getServerPort()))+request.getContextPath()+"/")%>upload/uploadImgLrs.do" type="hidden" >
<div style="display: none;">
    <input id="file_upload" name="file_upload" type="file" capture="camera" accept="image/*" multiple="false">
</div>
<div class="faceContent" id="faceContent">
    <div class="row faceText" id="emoDiv">
        <div class="col-xs-10" id="emoInput" contenteditable="true"></div>
        <div class="col-xs-2"><button type="button" class="btn btn-default" id="msg-send">发送</button></div>
    </div>
    <div class="faceImg">
        <div id="faceE" class="face">表情</div>
        <div id="faceP" class="face">图片</div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/jQuery/sinaface/jquery.sinaEmotion.js"/>"></script>

<script type="text/javascript" src="<c:url value="/jQuery/uploadImg/exif.js?v=b26c6d5"/>"></script>
<script type="text/javascript" src="<c:url value="/jQuery/uploadImg/lrz.js?v=7bc1191"/>"></script>
<script type="text/javascript" src="<c:url value="/jQuery/uploadImg/lrz.mobile.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jQuery/uploadImg/mobileFix.mini.js?v=ab833c8"/>"></script>
<script type="text/javascript" src="<c:url value="/jQuery/commontool/upLoadfile.js"/>"></script>
<script type="text/javascript">
    $(function(){
        $('#faceE').SinaEmotion($('#emoInput'),$('#emoDiv'));
        $('#faceP').click(function(){
            $("#file_upload").click();
        });

        $("#msg-send").click(function(){
            mSendMessage();//引用改文件后,该方法必须重写
            mScrollTo("mScrollToEle");
            $("#emoInput").html("");
        });

        $("#file_upload").change(function(){
            upLoadImgs(this.files,$("#fileUploadPath").val(),function(data){
                var imgObj = "&nbsp;<img src=\"" + data + "\" />";
                $("#emoInput").append($(imgObj));
            })
        });
    });
</script>