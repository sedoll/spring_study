<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div>
    <div>
        <a href="${path}/menu/list.do?name=신구로초">신구로초등학교</a>
        <a href="${path}/menu/list.do?name=고척중">고척중학교</a>
        <a href="${path}/menu/list.do?name=경인고">경인고등학교</a>
    </div>
    <h2>${schoolName}등학교 식단표</h2>
    <c:forEach var="eat" items="${ddishList }" varStatus="status">
        <div>
            <h3>날짜 : ${mlsvList.get(status.index)}</h3>
            ${eat}
        </div>
        <br>
        <hr>
        <br>
    </c:forEach>
</div>
</body>
</html>
