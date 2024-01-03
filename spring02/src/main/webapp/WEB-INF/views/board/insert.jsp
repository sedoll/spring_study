<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>insert</title>
</head>
<body>
<h1>입력 폼</h1>
<form action="${path}/board/insert" method="post">
    <input type="text" name="title" id="title" placeholder="title" required>
    <input type="text" name="content" id="content" placeholder="content" required>
    <input type="text" name="id" id="id" placeholder="id" required>
    <input type="submit" value="입력">
    <input type="reset" value="초기화">
</form>
</body>
</html>
