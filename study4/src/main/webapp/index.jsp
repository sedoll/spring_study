<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a href="${path}/test/testList"> TEST </a>
    <br>
    <a href="${path}/test/addCollection"> TEST+EMP 추가 </a>
</body>
</html>