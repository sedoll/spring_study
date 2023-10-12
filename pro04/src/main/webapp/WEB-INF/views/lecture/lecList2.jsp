<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }

        .img_tit {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .img_tit img {
            max-height: 200px;
            overflow: hidden;
        }

        #myTable td {
            height: 280px;
            overflow: hidden;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-medium is-white">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            자유게시판
        </p>
        <p class="subtitle is-size-5">
            목록
        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <table id="myTable">
                <thead>
                <tr>
                    <th></th>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="pro" items="${lecList }">
                    <tr>
                        <td class="item1">
                            <div class="img_tit"><a href="${path}/lecture/getLecture?no=${pro.no}"><img src="${path }/resources/upload/${pro.simg }"/></a></div>
                        </td>
                        <td class="item2">
                            <p>${pro.title}</p>
                        </td>
                        <td class="item3">
                            <p>${pro.cnt}</p>
                        </td>
                        <td class="item4">
                            <c:if test="${not empty sid}">
                                <c:set var="isLiked" value="${likedProductIds.contains(pro.no)}" />
                                <a href="${path }/AddPayment.do?pno=${pro.no }" class="btn1">구매하기</a>
                                <a href="${path }/AddCart.do?pno=${pro.no }" class="btn1">장바구니</a>
                                <c:choose>
                                    <c:when test="${isLiked }">
                                        <%-- 눌러도 새로고침 안되게 처리 ///                         현재 로그인한 사용자 ID                 pro.no을 저장하기 위한 역할 --%>
                                        <a href="javascript:void(0);" onclick="toggleLike(${pro.no}, '${sessionScope.sid}');" class="likebtn" data-product-id="${pro.no}" style="color: #ff5050">♥</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:void(0);" onclick="toggleLike(${pro.no}, '${sessionScope.sid}');" class="likebtn" data-product-id="${pro.no}"  style="color: #b4b4b4">♥</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:if>
                            <script>
                                function toggleLike(productNo, ${sid }) {
                                    $.ajax({
                                        url: "ProductLike.do",
                                        method: "POST",
                                        data: {
                                            pno: productNo,
                                            sid: ${sid }
                                        },
                                        success: function(response) {
                                            var likeButton = $("[data-product-id='" + productNo + "']");

                                            if (response.trim() === "liked") {
                                                alert("상품을 좋아요 했습니다!");
                                                likeButton.css("color","#ff5050");
                                            } else if (response.trim() === "unliked") {
                                                alert("상품의 좋아요를 취소했습니다.");
                                                likeButton.css("color","#b4b4b4");                                                } else {
                                                alert("오류가 발생했습니다. 다시 시도해주세요.");
                                            }
                                        }
                                    });
                                }
                                $(document).ready(function() {
                                    // 좋아요 상태를 기반으로 버튼 색 변경
                                    $(".inbtn").each(function() {
                                        var isLiked = $(this).hasClass("liked");
                                        if (isLiked) {
                                            $(this).addClass("liked");
                                        }
                                    });
                                });
                            </script>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <script>
                $(document).ready( function () {
                    $('#myTable').DataTable({
                        //search 창 오른쪽 상단으로 이동
                        "dom": '<"top"i>rt<"bottom"flp><"clear">',

                        pageLength : 5,
                        order: [[3, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                        info: false,
                        lengthChange: false, // show entries 제거
                        language: {
                            emptyTable: '등록된 상품이 없습니다.'
                        }

                    });
                } );
                $(document).ready(function() {
                    $('.dataTables_paginate').css({
                        'textAlign':'left',
                        'float': 'none',
                        'margin-top':'10px',
                    });
                    $('.dataTables_filter').css({
                        'float': 'left',
                        'margin-top':'14px',
                        'margin-right':'280px'
                    });
                    $('#myTable_paginate').css({
                        'margin-right':'120px'
                    });


                });

            </script>
            <div class="btn_group">
                <c:if test="${sid eq 'admin' }">
                    <a href="${path}/lecture/addLectureForm" class="inbtn">상품 등록</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>