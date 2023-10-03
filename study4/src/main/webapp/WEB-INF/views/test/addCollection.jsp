<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Test + EMP 추가 </title>
</head>
<body>
<form action="${path}/transaction/addCollection" method="post">
    <fieldset>
        <label for="num"> num </label>
        <input type="number" min="1" id="num" name="num">
        <label for="title"> title </label>
        <input type="text" id="title" name="title">
    </fieldset>
    <fieldset>
        <label for="emp_no"> emp_no </label>
        <input type="number" min="1" id="emp_no" name="emp_no">
        <label for="first_name"> first_name </label>
        <input type="text" id="first_name" name="first_name">
    </fieldset>
    <input type="submit" value="전송">
</form>
</body>
</html>