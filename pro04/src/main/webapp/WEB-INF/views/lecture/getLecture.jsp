<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세</title>
    <%@ include file="../include/head.jsp" %>

    <!-- Bulma CSS 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.10.1/css/bulma.min.css">
    <!-- 단일 페이지 사용자 정의 CSS 추가 -->
    <link rel="stylesheet" href="${path}/resources/css/video.css">
    <link rel="stylesheet" href="${path}/resources/css/lec2.css">
    <style>
        /* 사용자 정의 스타일 추가 */
        body {
            background-color: white; /* 페이지 배경색 */
        }
        .product {
            background-color: #fff; /* 상품 배경색 */
            padding: 20px;
            border-radius: 5px;
        }
        .productimg img {
            max-width: 100%;
            border: 5px solid #3273dc; /* 이미지 경계선 */
            border-radius: 5px;
        }
        .productdesc table td {
            font-size: 18px;
            color: #333;
        }
        .inbtn {
            background-color: #3273dc; /* 버튼 배경색 */
            color: #fff; /* 버튼 텍스트 색상 */
        }
        .inbtn:hover {
            background-color: #2558a8; /* 버튼 호버 배경색 */
        }
    </style>
</head>

<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../include/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">강의 상세</h2>

                <div class="product">
                    <div class="productimg">
                        <h3>OT(맛보기 영상)</h3>
                        <c:if test="${not empty pro.sfile1}">
                            <div class="player">
                                <div class="vdo_fr">
                                    <video id="video">
                                        <source src="${path}/resources/upload/${pro.sfile1}" type="video/mp4" />
                                    </video>
                                </div>
                                <div id="timebar">
                                    <span id="currentTime"></span>
                                </div>
                                <div id="buttonbar">
                                    <button id="restart" class="player_btn"></button>
                                    <button id="rew" class="player_btn"></button>
                                    <button id="play" class="player_btn"></button>
                                    <button id="pause" class="player_btn"></button>
                                    <button id="stop" class="player_btn"></button>
                                    <button id="fastFwd" class="player_btn"></button>
                                    <button id="mute" class="player_btn"></button>
                                    <button id="unmute" class="player_btn"></button>
                                    <input id="vol" type="range" value="500" min="0" max="1000">
                                    <button id="vmup" class="player_btn"></button>
                                    <button id="vmdown" class="player_btn"></button>
                                    <button id="volTxt">100%</button>
                                    <button id="sizeup" class="player_btn"></button>
                                    <button id="sizedown" class="player_btn"></button>
                                    <button id="full" class="player_btn"></button>
                                    <button id="original" class="player_btn"></button>
                                </div>
                                <div id="progress">
                                    <div id="progressBar"></div>
                                </div>
                            </div>
                        </c:if>
                        <script src="${path}/resources/js/vdo.js"></script>
                    </div>
                    <div class="productdesc">
                        <table class="table is-fullwidth">
                            <tr class="pname">
                                <th colspan="2">${pro.title}</th>
                            </tr>
                            <tr class="pprice">
                                <th>강좌 수준</th>
                                <td>중1</td>
                                <%--                                <td>${pro.price} 원</td>--%>
                            </tr>
                            <tr class="pcate">
                                <th>학습 단계</th>
                                <td>기초 수학</td>
                                <%--                                <td>카테고리: ${pro.cname}</td>--%>
                            </tr>
                            <tr class="pdate">
                                <th>수강 기간</th>
                                <td>231012-231112</td>
                                <%--                                <td>출간일: ${pro.resdate}</td>--%>
                            </tr>
                            <tr class="pda">
                                <th>강사</th>
                                <td>홍길동</td>
                                <%--                                <td>출간일: ${pro.resdate}</td>--%>
                            </tr>
                            <tr class="test1">
                                <th>타입</th>
                                <td>온라인</td>
                                <%--                                <td>출간일: ${pro.resdate}</td>--%>
                            </tr>
                            <tr class="test2">
                                <th>영상 수</th>
                                <td>5</td>
                                <%--                                <td>출간일: ${pro.resdate}</td>--%>
                            </tr>
                            <tr class="pbtn">
                                <c:if test="${not empty sid}">
                                <c:set var="isLiked" value="${likedProductIds.contains(pro.no)}" />
                                <td><a href="${path}/AddPayment.do?pno=${pro.no}" class="button is-success inbtn">수강하기</a>
                                    <a href="${path}/AddCart.do?pno=${pro.no}" class="button is-info inbtn">장바구니</a>
                                    <c:choose>
                                    <c:when test="${isLiked}">
                                    <a href="javascript:void(0);" onclick="toggleLike(${pro.no}, '${sessionScope.sid}');" class="inbtn" data-product-id="${pro.no}" style="color: #ff5050">♥</a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="javascript:void(0);" onclick="toggleLike(${pro.no}, '${sessionScope.sid}');" class="inbtn" data-product-id="${pro.no}" style="color: #b4b4b4">♥</a>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:if>
                            </tr>
                            <tr>
                                <td class="adminbtn">
                                    <c:if test="${sid eq 'admin'}">
                                        <a href="${path}/UpdateProduct.do?no=${pro.no}" class="inbtn">수정</a>
                                        <a href="${path}/DeleteProduct.do?no=${pro.no}" class="inbtn delete_btn">삭제</a>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
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
                                    likeButton.css("color","#b4b4b4");
                                } else {
                                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                                }
                            }
                        });
                    }
                    $(document).ready(function() {
                        $(".inbtn").each(function() {
                            var isLiked = $(
                                this).hasClass("liked");
                            if (isLiked) {
                                $(this).addClass("liked");
                            }
                        });
                    });
                </script>

                <table class="table is-fullwidth">
                    <thead>
                    <tr class="title">
                        <th colspan="5">상세 설명</th>
                    </tr>
                    </thead>
                </table>
                <table class="table is-fullwidth">
                    <tr>
                        <td class="adminbtn" colspan="5">
                            ${pro.content}
                            <br><br><br>
                        </td>
                    </tr>
                </table>

                <%-- 강의 영상이랑 qna는 강의를 구매한 사람만 볼 수 있도록 설정 --%>
                <table class="table is-fullwidth">
                    <thead>
                    <tr class="title">
                        <th colspan="5">강의 영상</th>
                    </tr>
                    </thead>
                </table>
                <table class="table is-fullwidth">
                    <tr>
                        <td class="adminbtn">
                            <c:if test="${not empty pro.sfile2}">
                            <div class="player">
                                <div class="vdo_fr">
                                    <video id="video">
                                        <source src="${path}/resources/upload/${pro.sfile2}" type="video/mp4" />
                                    </video>
                                </div>
                                <div id="timebar">
                                    <span id="currentTime"></span>
                                </div>
                                <div id="buttonbar">
                                    <button id="restart" class="player_btn"></button>
                                    <button id="rew" class="player_btn"></button>
                                    <button id="play" class="player_btn"></button>
                                    <button id="pause" class="player_btn"></button>
                                    <button id="stop" class="player_btn"></button>
                                    <button id="fastFwd" class="player_btn"></button>
                                    <button id="mute" class="player_btn"></button>
                                    <button id="unmute" class="player_btn"></button>
                                    <input id="vol" type="range" value="500" min="0" max="1000">
                                    <button id="vmup" class="player_btn"></button>
                                    <button id="vmdown" class="player_btn"></button>
                                    <button id="volTxt">100%</button>
                                    <button id="sizeup" class="player_btn"></button>
                                    <button id="sizedown" class="player_btn"></button>
                                    <button id="full" class="player_btn"></button>
                                    <button id="original" class="player_btn"></button>
                                </div>
                                <div id="progress">
                                    <div id="progressBar"></div>
                                </div>
                            </div>
                            </c:if>
                            <script src="${path}/resources/js/vdo.js"></script>
                        </td>
                    </tr>
                    <tr>
                        <td class="adminbtn">
                            <c:if test="${not empty pro.sfile3}">
                                <div class="player">
                                    <div class="vdo_fr">
                                        <video id="video">
                                            <source src="${path}/resources/upload/${pro.sfile3}" type="video/mp4" />
                                        </video>
                                    </div>
                                    <div id="timebar">
                                        <span id="currentTime"></span>
                                    </div>
                                    <div id="buttonbar">
                                        <button id="restart" class="player_btn"></button>
                                        <button id="rew" class="player_btn"></button>
                                        <button id="play" class="player_btn"></button>
                                        <button id="pause" class="player_btn"></button>
                                        <button id="stop" class="player_btn"></button>
                                        <button id="fastFwd" class="player_btn"></button>
                                        <button id="mute" class="player_btn"></button>
                                        <button id="unmute" class="player_btn"></button>
                                        <input id="vol" type="range" value="500" min="0" max="1000">
                                        <button id="vmup" class="player_btn"></button>
                                        <button id="vmdown" class="player_btn"></button>
                                        <button id="volTxt">100%</button>
                                        <button id="sizeup" class="player_btn"></button>
                                        <button id="sizedown" class="player_btn"></button>
                                        <button id="full" class="player_btn"></button>
                                        <button id="original" class="player_btn"></button>
                                    </div>
                                    <div id="progress">
                                        <div id="progressBar"></div>
                                    </div>
                                </div>
                            </c:if>
                            <script src="${path}/resources/js/vdo.js"></script>
                        </td>
                    </tr>
                    <tr>
                        <td class="adminbtn">
                            <c:if test="${not empty pro.sfile4}">
                                <div class="player">
                                    <div class="vdo_fr">
                                        <video id="video">
                                            <source src="${path}/resources/upload/${pro.sfile4}" type="video/mp4" />
                                        </video>
                                    </div>
                                    <div id="timebar">
                                        <span id="currentTime"></span>
                                    </div>
                                    <div id="buttonbar">
                                        <button id="restart" class="player_btn"></button>
                                        <button id="rew" class="player_btn"></button>
                                        <button id="play" class="player_btn"></button>
                                        <button id="pause" class="player_btn"></button>
                                        <button id="stop" class="player_btn"></button>
                                        <button id="fastFwd" class="player_btn"></button>
                                        <button id="mute" class="player_btn"></button>
                                        <button id="unmute" class="player_btn"></button>
                                        <input id="vol" type="range" value="500" min="0" max="1000">
                                        <button id="vmup" class="player_btn"></button>
                                        <button id="vmdown" class="player_btn"></button>
                                        <button id="volTxt">100%</button>
                                        <button id="sizeup" class="player_btn"></button>
                                        <button id="sizedown" class="player_btn"></button>
                                        <button id="full" class="player_btn"></button>
                                        <button id="original" class="player_btn"></button>
                                    </div>
                                    <div id="progress">
                                        <div id="progressBar"></div>
                                    </div>
                                </div>
                            </c:if>
                            <script src="${path}/resources/js/vdo.js"></script>
                        </td>
                    </tr>
                    <tr>
                        <td class="adminbtn">
                            <c:if test="${not empty pro.sfile5}">
                                <div class="player">
                                    <div class="vdo_fr">
                                        <video id="video">
                                            <source src="${path}/resources/upload/${pro.sfile5}" type="video/mp4" />
                                        </video>
                                    </div>
                                    <div id="timebar">
                                        <span id="currentTime"></span>
                                    </div>
                                    <div id="buttonbar">
                                        <button id="restart" class="player_btn"></button>
                                        <button id="rew" class="player_btn"></button>
                                        <button id="play" class="player_btn"></button>
                                        <button id="pause" class="player_btn"></button>
                                        <button id="stop" class="player_btn"></button>
                                        <button id="fastFwd" class="player_btn"></button>
                                        <button id="mute" class="player_btn"></button>
                                        <button id="unmute" class="player_btn"></button>
                                        <input id="vol" type="range" value="500" min="0" max="1000">
                                        <button id="vmup" class="player_btn"></button>
                                        <button id="vmdown" class="player_btn"></button>
                                        <button id="volTxt">100%</button>
                                        <button id="sizeup" class="player_btn"></button>
                                        <button id="sizedown" class="player_btn"></button>
                                        <button id="full" class="player_btn"></button>
                                        <button id="original" class="player_btn"></button>
                                    </div>
                                    <div id="progress">
                                        <div id="progressBar"></div>
                                    </div>
                                </div>
                            </c:if>
                            <script src="${path}/resources/js/vdo.js"></script>
                        </td>
                    </tr>
                </table>

                <table class="table is-fullwidth">
                    <thead>
                    <tr class="title">
                        <th colspan="5">QNA</th>
                    </tr>
                    </thead>
                </table>
                <table class="table is-fullwidth">
                    <tr>
                        <td class="adminbtn" colspan="5">
                            ${pro.content}
                            <br><br><br>
                        </td>
                    </tr>
                </table>

                <table class="table is-fullwidth" id="myTable">
                    <thead>
                    <tr class="title">
                        <th colspan="5">후기</th>
                    </tr>
                    <tr>
                        <th class="item1">작성자</th>
                        <th class="item2">댓글</th>
                        <th class="item3">작성일</th>
                        <th class="item4"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lev" items="${revList }">
                        <tr>
                            <td class="item1">${lev.cid}</td>
                            <td class="item2">${lev.content}</td>
                            <td class="item3">${lev.resdate}</td>
                            <td class="item4">
                                <c:if test="${sid eq lev.cid || sid eq 'admin'}">
                                    <a href="${path}/UpdateReview.do?cid=${lev.cid}&par=${pro.no}" class="button is-info inbtn">수정</a>
                                    <a href="${path}/DeleteReview.do?cid=${lev.cid}&par=${pro.no}" class="button is-danger inbtn delete_btn"> 삭제 </a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            // sorting 화살표 제거
                            "targets": 'no-sort',
                            "bSort": false,

                            // 3번째 컬럼을 기준으로 내림차순 정렬
                            order: [[3, 'asc']],
                            pageLength : 5,
                            searching: false, //검색 제거
                            lengthChange: false, // show entries 제거
                            info: false,
                            language: {
                                emptyTable: '작성된 후기가 없습니다.'
                            }
                        });
                        $('#myTable').css({
                            'border':'none',
                        });
                    } );
                </script>
                <form action="${path}/AddReview.do" id="login_frm" class="frm">
                    <table class="table is-fullwidth">
                        <tbody>
                        <tr>
                            <c:choose>
                                <c:when test="${check == '2'}">
                                    <th>${sid}</th>
                                    <th><textarea name="content" id="content" class="textarea" placeholder="리뷰 작성" required></textarea></th>
                                    <th><input type="submit" value="글쓰기" class="button is-success inbtn" id="ans_btn"></th>
                                    <input type="hidden" name="pno" value="${pro.no}" readonly>
                                </c:when>
<%--                                <c:when test="${check == '1'}">--%>
<%--                                    <p id="nologin_comment">구매 확정을 해야 후기 작성이 가능합니다.</p>--%>
<%--                                </c:when>--%>
                                <c:otherwise>
                                    <p id="nologin_comment">수강생만 작성 가능합니다.</p>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <footer class="ft" id="ft">
                <%@ include file="../include/footer.jsp" %>
            </footer>
        </section>
    </div>
</div>
</body>
</html>