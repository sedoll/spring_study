<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼 메인 페이지</title>
    <jsp:include page="./include/head.jsp"/>
</head>
<body>
    <jsp:include page="./include/header.jsp"/>
    <section class="hero is-primary">
        <div class="hero-body">
            <p class="title">
                티스푼
            </p>
            <p class="subtitle">
                메인
            </p>
        </div>
    </section>
    <div class="content" id="content">
        <div class="row column text-center">
            <div class="container">
                <h2>${not empty newsName ? newsName : '뉴스'} 검색</h2>
                <form action="${path}/news/list.do" method="post">
                    <input type="text" name="search" id="search" class="input" placeholder="뉴스 제목 입력" required autofocus>
                    <input class="button is-primary" type="submit" value="확인">
                </form>
                <hr>
                <article class="media">
                    <div class="media-content">
                        <div class="content" style="margin-left: 150px;  margin-right: 150px;">
                            <c:forEach var="item" items="${titleList}" varStatus="status"> <%-- 가져온 url중 64-72번째만 나오게한다--%>
                                <br>
                                <p>
                                    <a href="${urlList.get(status.index)}" target="_blank"><strong style="color: black;font-size: 30px;font-weight: bold;">${titleList.get(status.index)}</strong></a>   <small>${companyList.get(status.index)}</small>
                                    <br><br>
                                        ${textList.get(status.index)}..<a href="${urlList.get(status.index)}" style="color: black">더보기</a>
                                <hr>
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                </article>
                <hr>
            </div>

        </div>
    </div>
    <jsp:include page="./include/footer.jsp"/>
</body>
</html>