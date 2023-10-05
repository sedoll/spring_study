<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test6</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <ul>
        <li><a href="${path1}/ajax/">Home</a></li>
    </ul>
    <input type="text" id="age" name="age" placeholder="나이" required><br><br>
    <input type="text" id="name" name="name" placeholder="이름" required><br><br>
    <button id="btn6" type="button" age="38" name="홍길동">Post 전송</Button>
    <script>
        $(document).ready(function () {
            $("#btn6").click(function () {
                var human = {"age":parseInt($("#age").val()), "name":$("#name").val()}
                $.ajax({
                    type:"post",
                    url:"${path1}/ajax/test6pro",
                    data:human,
                    success:function (res) { console.log("성공", res)},
                    error:function (err) {console.log("실패", err)}
                })
            })
        })
    </script>
</body>
</html>
