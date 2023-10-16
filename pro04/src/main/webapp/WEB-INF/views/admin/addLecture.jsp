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
                <form action="${path}/lecture/addLecture" class="frm" method="post" enctype="multipart/form-data">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th>과목</th>
                            <td colspan="2">
                                <select name="cate" id="cate" class="indata" autofocus required>
                                    <option value="국어" selected>국어</option>
                                    <option value="수학">수학</option>
                                    <option value="영어">영어</option>
                                    <option value="과학">과학</option>
                                    <option value="과학">사회</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>수강 대상</th>
                            <td colspan="2">
                                <select name="level1" id="level1" class="indata" autofocus required>
                                    <option value="초등학교" selected>초등학교</option>
                                    <option value="중학교">중학교</option>
                                    <option value="고등학교">고등학교</option>
                                </select>

                                <select name="level2" id="level2" class="indata" autofocus required>--%>
                                    <option value="1학년" id="op1" selected>1학년</option>
                                    <option value="2학년" id="op2">2학년</option>
                                    <option value="3학년" id="op3">3학년</option>
                                    <option value="4학년" id="op4">4학년</option>
                                    <option value="5학년" id="op5">5학년</option>
                                    <option value="6학년" id="op6">6학년</option>
                                </select>

                                <script>
                                    var c1 = document.getElementById("level1");
                                    var c2 = document.getElementById("level2");
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
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <th>강의 이름</th>
                            <td colspan="2"><input type="text" name="title" id="title" class="indata" placeholder="상품 이름 입력" required></td>
                        </tr>
                        <tr>
                            <th>강사 이름</th>
                            <td colspan="2">
                                <select name="ino" id="ino" class="indata" autofocus required>
                                    <c:forEach items="${instList}" var="inst" varStatus="status">
                                        <option value="${inst.no}">${inst.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>강의 설명</th>
                            <td colspan="2"> <textarea name="content" id="content" cols="50" rows="15" placeholder="상품 설명 입력" required></textarea></td>
                        </tr>
                        <tr>
                            <th>강의 가격</th>
                            <td colspan="2"><input type="number" name="price" id="price" class="indata" placeholder="가격 입력" required></td>
                        </tr>
                        <tr>
                            <th>최대 수강인원</th>
                            <td colspan="2"><input type="text" name="lec_max" id="lec_max" class="indata" placeholder="최대 수강인원" required></td>
                        </tr>
                        <tr>
                            <th>수강신청 시작일</th>
                            <td colspan="2"><input type="date" name="aplctClss1" id="aplctClss1" class="indata" placeholder="수강신청 시작일" required></td>
                        </tr>
                        <tr>
                            <th>수강신청 마감일</th>
                            <td colspan="2"><input type="date" name="aplctClss2" id="aplctClss2" class="indata" placeholder="수강신청 마감일" required></td>
                        </tr>
                        <tr>
                            <th>강의 시작일</th>
                            <td colspan="2"><input type="date" name="studystart" id="studystart" class="indata" placeholder="강의 시작일" required></td>
                        </tr>
                        <tr>
                            <th>강의 종료일</th>
                            <td colspan="2"><input type="date" name="studyend" id="studyend" class="indata" placeholder="강의 종료일" required></td>
                        </tr>
                        <tr>
                            <th>최대 수강일</th>
                            <td colspan="2"><input type="int" name="endDay" id="endDay" class="indata" placeholder="최대 수강일" required></td>
                        </tr>
                        <tr>
                            <th>표지 이미지</th>
                            <td colspan="2"><input type="file" name="simg" id="simg" class="indata" placeholder="표지 이미지" accept=".jpg, .png" required></td>
                        </tr>
                        <tr>
                            <th>샘플(OT) 영상</th>
                            <td colspan="2"><input type="file" name="sfile1" id="sfile1" class="indata" placeholder="샘플 영상1" accept=".mp4" required></td>
                        </tr>
                        <tr>
                            <th>강의 영상 1</th>
                            <td colspan="2"><input type="file" name="sfile2" id="sfile2" class="indata" placeholder="강의 영상1" accept=".mp4" required></td>
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