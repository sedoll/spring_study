<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 정보 작성</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height: 100vh; background-image: url("${path}/img/login.jpg");
            background-repeat: no-repeat; background-position: center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center;  color:#fff;
            padding-bottom: 1.3em; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { margin:0 auto; font-size: 24px;}
        .tb1 th { width: 200px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td { width: 400px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}

        .tb1 td:last-child { line-height: 48px; padding-top:24px; padding-bottom:24px; }


        .inbtn { display:block;
            border-radius:10px;
            min-width:120px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 38px;
            background-color: #333;
            color:#fff;
            font-size: 18px;
            cursor: pointer; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }

        .inbtn:hover {
            background-color: #666666;
        }
        .indata {
            display:inline-block;
            width: 590px;
            height: 40px;
            line-height: 40px;
            text-indent:10px;
            font-size:16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px 15px;
        }

        textarea {
            resize: none;
            width: 600px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../include/header.jsp" %>
    </header>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-white">
                <div class="hero-body has-text-centered">
                    <p class="title is-size-3">
                        강의
                    </p>
                    <p class="subtitle is-size-5">
                        등록
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <form action="${path}/lecture/updateLecture.do" class="frm" method="post" enctype="multipart/form-data">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th>과목</th>
                            <td colspan="2">
                                <input type="hidden" name="no" id="no" value="${lecture.no}" readonly>
                                <select name="cate" id="cate" class="indata" autofocus required>
                                    <c:choose>
                                        <c:when test="${lecture.cate eq '국어'}">
                                            <option value="국어" selected>국어</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="국어">국어</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${lecture.cate eq '수학'}">
                                            <option value="수학" selected>수학</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="수학">수학</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${lecture.cate eq '영어'}">
                                            <option value="영어" selected>영어</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="영어">영어</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${lecture.cate eq '과학'}">
                                            <option value="과학" selected>과학</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="과학">과학</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${lecture.cate eq '사회'}">
                                            <option value="사회" selected>사회</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="사회">사회</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>수강 대상</th>
                            <td colspan="2">
                                <c:set var="splitValues" value="${fn:split(lecture.slevel, ' ')}" />
                                <c:set var="level1" value="${splitValues[0]}" />
                                <c:set var="level2" value="${splitValues[1]}" />

                                <select name="level1" id="level1" class="indata" autofocus required>
                                    <c:choose>
                                        <c:when test="${level1 eq '초등학교'}">
                                            <option value="초등학교" selected>초등학교</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="초등학교">초등학교</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level1 eq '중학교'}">
                                            <option value="중학교" selected>중학교</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="중학교">중학교</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level1 eq '고등학교'}">
                                            <option value="고등학교" selected>고등학교</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="고등학교">고등학교</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>

                                <select name="level2" id="level2" class="indata" autofocus required>
                                    <c:choose>
                                        <c:when test="${level2 eq '1학년'}">
                                            <option value="1학년" selected>1학년</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1학년">1학년</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level2 eq '2학년'}">
                                            <option value="2학년" selected>2학년</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="2학년">2학년</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level2 eq '3학년'}">
                                            <option value="3학년" selected>3학년</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="3학년">3학년</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level2 eq '4학년'}">
                                            <option value="4학년" selected>4학년</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="4학년">4학년</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level2 eq '5학년'}">
                                            <option value="5학년" selected>5학년</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="5학년">5학년</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${level2 eq '6학년'}">
                                            <option value="6학년" selected>6학년</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="6학년">6학년</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>

                                <script>
                                    $(document).ready(function () {
                                        var c1 = document.getElementById("level1");
                                        var op1 = document.querySelectorAll("#op1,#op2,#op3");
                                        var op2 = document.querySelectorAll("#op4,#op5,#op6");

                                        c1.addEventListener("change", function() {
                                            if (c1.value === "초등학교") {
                                                op2.forEach(option => {
                                                    option.style.display = "block";
                                                });
                                            } else {
                                                op1.forEach(option => {
                                                    option.style.display = "block";
                                                });

                                                op2.forEach(option => {
                                                    option.style.display = "none";
                                                });
                                            }
                                        });
                                    })
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <th>강의 이름</th>
                            <td colspan="2"><input type="text" name="title" id="title" class="indata" value="${lecture.title}" placeholder="상품 이름 입력" required></td>
                        </tr>
                        <tr>
                            <th>강사 이름</th>
                            <td colspan="2">
                                <select name="ino" id="ino" class="indata" autofocus required>
                                    <c:forEach items="${instList}" var="inst">
                                        <c:choose>
                                            <c:when test="${inst.name eq instructor.name}">
                                                <option value="${inst.no}" selected>${inst.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${inst.no}">${inst.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>강의 설명</th>
                            <td colspan="2">
                                <textarea name="content" id="content" cols="50" rows="15" placeholder="상품 설명 입력" required>
                                    ${lecture.content}
                                </textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>표지 이미지</th>
                            <td colspan="2"><input type="file" name="simg" id="simg" class="indata" placeholder="표지 이미지" accept=".jpg, .png"></td>
                        </tr>
                        <tr>
                            <th>샘플(OT) 영상</th>
                            <td colspan="2"><input type="file" name="sfile1" id="sfile1" class="indata" placeholder="샘플 영상1" accept=".mp4"></td>
                        </tr>
                        <tr>
                            <th>강의 영상 1</th>
                            <td colspan="2"><input type="file" name="sfile2" id="sfile2" class="indata" placeholder="강의 영상1" accept=".mp4"></td>
                        </tr>
                        <tr>
                            <th>강의 영상 2</th>
                            <td colspan="2"><input type="file" name="sfile3" id="sfile3" class="indata" placeholder="강의 영상2" accept=".mp4"></td>
                        </tr>
                        <tr>
                            <th>강의 영상 3</th>
                            <td colspan="2"><input type="file" name="sfile4" id="sfile4" class="indata" placeholder="강의 영상3" accept=".mp4"></td>
                        </tr>
                        <tr>
                            <th>강의 영상 4</th>
                            <td colspan="2"><input type="file" name="sfile5" id="sfile5" class="indata" placeholder="강의 영상4" accept=".mp4"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="상품등록" class="inbtn">
                                <input type="reset" value="취소" class="inbtn" onclick="window.history.back();">
                                <a href="${path}/lecture/lecList" class="inbtn">상품목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
</body>
</html>