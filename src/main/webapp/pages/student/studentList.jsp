<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-10-31
  Time: 下午3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>请选择学生</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/jQuery/jqm/jquery.mobile-1.4.5.min.css"/>">
    <link type="text/css" rel="stylesheet" href="<c:url value="/jQuery/bootstrap/css/bootstrap.min.css"/>" />
    <script type="text/javascript" src="<c:url value="/jQuery/commontool/jquery-1.8.3.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/jQuery/jqm/jquery.mobile-1.4.5.min.js"/>"></script>
</head>
<body>
        <div class="container" style="text-align: center;font-weight:bold">
            <h1>请选择要查看的学生</h1>
            <ul data-role="listview">
                <c:forEach items="${requestScope.objectList}" var="object">
                <li>
                    <a href="<c:url value="/student/jb/student.do?studentId=${object.studentId}&studentUserId=${object.studentUserId}&weChatId=${object.weChatId}"/>" data-ajax="false" >${object.studentName}</a>
                </li>
                </c:forEach>
            </ul>
        </div>

</body>
</html>