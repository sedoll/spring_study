<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jquery 를 이용한 유효성 검사 - check3.jsp</title>
    <%-- j쿼리 연결 --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
    <div class="container">
        <!-- 영문 소문자와 숫자 조합 글자 길이 5~12 글자 사이의 유효성 패턴 -->
        id : <input type="text" name="id" id="id" required/><br><br>
        <!-- 영문 소문자 대문자, 숫자 조합 8~12 글자 사이의 유효성 패턴 -->
        pw : <input type="password" name="pw" id="pw" required/><br><br>
        <button type="button" id="submit-btn">확인</button>
    </div>
    <script>
        $(document).ready(function () {
            $("#submit-btn").click(function () {
                if($("#id").val()=="" || $("#pw").val()=="") {
                    alert("아이디 혹은 비밀번호를 입력하지 않았습니다.");
                    return false;
                }
                if($("#id").val().length < 5 || $("#id").val().length > 12) {
                    alert("아이디의 글자 수가 맞지 않습니다. 5~12글자 사이로 입력하시기 바랍니다.");
                    return false;
                }
                if($("#pw").val().length < 8 || $("#pw").val().length > 12) {
                    alert("비밀번호의 글자 수가 맞지 않습니다. 8~12글자 사이로 입력하시기 바랍니다.");
                    return false;
                }
                var idReg = /^[a-z0-9]{5,12}$/g;
                if(!idReg.test($("#id").val())){
                    alert("아이디 입력 형식이 맞지 않습니다.\n" +
                        "아이디는 5~12자리의 영어 소문자, 숫자만 사용 가능합니다.");
                    return false;
                }
                var pwReg = /^[a-zA-Z0-9]{8,12}$/g;
                if(!pwReg.test($("#pw").val())){
                    alert("비밀번호 입력 형식이 맞지 않습니다.\n" +
                        "비밀번호는 8~12자리의 영어 대소문자, 숫자만 사용 가능합니다.");
                    return false;
                }
                location.href = "./check3pro?id="+$("#id").val()+"&pw="+$("#pw").val();
            })
        })
    </script>
</body>
</html>
