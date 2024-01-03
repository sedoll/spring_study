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
    <title>board</title>
</head>
<body>
<h1>list</h1>
<ul>
    <c:forEach var="item" items="${blist}">
        <li>
            ${item.no}&nbsp;&nbsp;${item.title}
            <a href="${path}/board/detail?no=${item.no}">상세</a>
            <a href="${path}/board/update?no=${item.no}">수정</a>
            <a href="${path}/board/delete?no=${item.no}">삭제</a>
        </li>
    </c:forEach>
</ul>
<a href="${path}/board/insert">입력</a>
</body>
</html>
