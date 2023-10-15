<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path13" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
          crossorigin="anonymous"/>
    <!-- 부트스트랩 4.0 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/validateUser.css"/>
    <link href="${path13}/resources/css/myPage/com_write.css" rel="stylesheet">
    <script type="text/javascript" src="${path13}/resources/js/com_write.js" charset="UTF-8"></script>

    <title>수강내역</title>


</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>

<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

    <div class="content-wrap" style="float:left; margin-left: -50px">
            <h5 class="font"> 목록 > </h5>
            <br>

            <form class="content">

                <div id="ud_tab" style="float:left; margin-left: -20px">
                    <input type="radio" name="ud_tabs" id="tab1" checked>
                    <label for="tab1">수강내역</label>

                    <div id="ud_tab-content1" class="ud_content" style="float:left; margin-left: -20px">
                        <table class="tb1" id="myTable" style="width: 800px; margin-left: -20px">
                            <thead>
                            <tr>
                                <th class="item1">결제번호</th>
                                <th class="item2">결제정보</th>
                                <th class="item3">결제상품</th>
                                <th class="item4">작업</th>
                            </tr>
                            </thead>
                            <c:forEach var="pay" items="${payList }" varStatus="status">
                                <tr>
                                    <td class="item1">${pay.sno }</td>
                                    <td class="item2">
                                        <p>결제 방법 : ${pay.pmethod }</p>
                                        <p>결제 대행 : ${pay.pcom }</p>
                                        <p>결제 카드 : ${pay.cnum }</p>
                                        <p>결제 금액 : ${pay.price }</p>
                                    </td>
                                    <td class="item3">
                                        <span title="${pay.lec_no }">${pay.lec_name }</span>
                                    </td>
                                    <td class="item4">
                                        <c:if test="${pay.state==0}">
                                            <a href="${path }/ReturnPayment.do?sno=${pay.sno }" class="inbtn">환불요청</a>
                                            <a href="${path }/BuyPayment.do?sno=${pay.sno }" class="inbtn">구매확정</a>
                                        </c:if>
                                        <c:if test="${pay.state==1}">
                                            <span>구매 확정</span>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <script>
                        $(document).ready( function () {
                            $('#myTable').DataTable({
                                pageLength : 5,
                                order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                                info: false,
                                dom: 't<f>p',
                                language: {
                                    emptyTable: '결제 내역이 없습니다.'
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
                                'margin-right':'100px'
                            });
                        });
                    </script>
                    <%--<input type="button" id="check11" value="더보기">
                    <div class="error11"></div>--%>

                    </div> <%-- 작성글("ud_tab-content1") 끝--%>



            <%-- ---------------------------------------------------------------------------------------------  --%>


            </form>
        </div>







</div>
</div>


<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>
