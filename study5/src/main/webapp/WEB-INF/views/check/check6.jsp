<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form"%> <%-- 스프링에서 form을 불러옴, html form 이랑 기능은 같음 --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hibernate Validator에서 유효성 검사 - check6.jsp</title>
</head>
<body>
    <div class="container">
        <h2>hibernate Validator에서 유효성 검사</h2>
        <hr>
        <form:form action="./check6" method="post" modelAttribute="chk">
            아이디 : <form:input path="id"/><br><br>
            <form:errors path="id" element="div" delimiter=" "/>

            <%-- password 타입은 input과 다르게 전송하면 사라진다. --%>
            비밀번호 : <form:password path="pw"/><br><br>
            <form:errors path="pw" element="div" delimiter=" "/>

            <button class="btn" type="submit"> 전송 </button>
        </form:form>
    </div>
</body>
</html>
