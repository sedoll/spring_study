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
    <title>Test8</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <ul>
        <li><a href="${path1}/ajax/">Home</a></li>
    </ul>
    <input type="text" id="num" name="num" placeholder="연번" value="12" required><br><br>
    <input type="text" id="title" name="title" placeholder="제목" required><br><br>
    <button id="btn8" type="button">Post 전송</button>
    <button id="remove" type="button">지우기</button>

    <br><hr><br>
    <h3>결과</h3>
    <div id="res">
        <table id="tb1">
            <thead>
                <tr>
                    <th>연번</th>
                    <th>제목</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            $("#btn8").click(function () {
                var human = {"num":parseInt($("#num").val()), "title":$("#title").val()}
                var txt = ""
                $.ajax({
                    type:"post",
                    url:"${path1}/ajax/test8pro",
                    data:JSON.stringify(human),
                    dataType:"json",
                    contentType:"application/json",
                    success:function (res) {
                        console.log("성공", res)
                        console.log("성공", res[0])
                        for(let i in res) {
                            console.log(res[i])
                            txt = txt + "<tr><td>"+res[i].num+"</td><td>"+res[i].title+"</td></tr>"
                        }
                        $("#tb1 tbody").html(txt)
                    },
                    error:function (err) {console.log("실패", err)}
                })
            })
            $("#remove").click(function () {
                $("#res").empty()
            })
        })
    </script>
</body>
</html>
