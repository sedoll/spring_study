<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locale Test</title>
    <%-- j쿼리 추가 --%>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<nav>
    <a href="lang1">현재 언어</a>
    <a href="lang2?lang=ko">한국어</a>
    <a href="lang2?lang=en">영어</a>
</nav>
<h2><spring:message code="addBook.form.title.label" /> </h2>
<hr>
<h3><spring:message code="addBook.form.subtitle.label" /> </h3>
<p><spring:message code="addBook.form.bookId.label" /> </p>
<script>
    $(document).ready(function() {
        $("#btn1").click(function() {
            var test = { "num":$("#num").val(), "title":$("title").val()};
            $.ajax({
                type:"post",
                url:"${path1}/json/insertForm",
                data:test,
                success: function (t){console.log("성공", t)},
                error: function (err) {console.log("실패", err)}
            });
        });
    });
</script>
</body>
</html>
