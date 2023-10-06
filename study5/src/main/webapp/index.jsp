<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 메인페이지 </title>
</head>
<body>
    <h2>Hello World!</h2>
    <%--
    <a href="${path}/check/check1"> check1 </a><br>
    <a href="${path}/check/check2"> check2 </a><br>
    <a href="${path}/check/check3"> check3 </a><br>
    <a href="${path}/check/check4"> check4 </a><br>
    <a href="${path}/check/check5"> check5 </a><br>
    <a href="${path}/check/check6"> check6 </a><br>
    <a href="${path}/json/insertForm"> insertForm </a><br>
    <a href="${path}/json/insertForm2"> insertForm2 </a><br>
    <a href="${path}/ajax/"> ajaxHome </a><br> --%>
    <a href="${path}/user/loginForm"> login </a><br>
    <a href="${path}/user/agree"> join </a><br>
    <a href="${path}/user/read"> mypage </a><br>
    <a href="${path}/admin/list"> userList </a><br>
    <a href="${path}/file/fileUpload"> fileupload (개발 서버용, 1개만 업로드) </a><br>
    <a href="${path}/file/fileUpload2"> fileupload2 (운영 서버용, 여러개 업로드)</a><br>
    <a href="${path}/file/fileUpload3"> fileupload3 (운영 서버용, 여러개 업로드)</a><br>
</body>
</html>