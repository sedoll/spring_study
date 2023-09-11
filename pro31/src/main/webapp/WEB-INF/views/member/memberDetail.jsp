<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="../css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        /* 테이블 헤더 스타일 */
        th {
            background-color: #f2f2f2;
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        /* 테이블 데이터 셀 스타일 */
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        /* 홀수 행 배경색 변경 */
        tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        /* 첫 번째 열 스타일 (라벨 열) */
        th:first-child,
        td:first-child {
            width: 30%;
            font-weight: bold;
        }

        /* 두 번째 열 스타일 (데이터 열) */
        th:nth-child(2),
        td:nth-child(2) {
            width: 70%;
        }
    </style>
</head>

<%--
    List<Board> boardList = new ArrayList<>();
    int bno = Integer.parseInt(request.getParameter("bno"));

    DBC con = new MariaDBCon();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Date d;  //날짜데이터로 변경
    String date;
    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");

    try{
        // 조회수 갱신 코드
        conn = con.connect();
        String sql = "update board set cnt=cnt+1 where par=? and lev=0";
        System.out.println(bno);
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("조회수 갱신 완료");
        } else {
            System.out.println("조회수 갱신 실패");
        }

        // 해당 qno(par) 번호를 갖는 게시물 내용, 댓글 불러오기
        String sql2 = "select * from board where par=? order by lev";
        pstmt = conn.prepareStatement(sql2);
        pstmt.setInt(1, bno);
        rs = pstmt.executeQuery();
        while(rs.next()) {
            Board board = new Board();
            board.setBno(rs.getInt("bno"));
            board.setTitle(rs.getString("title"));
            board.setAuthor(rs.getString("author"));
            board.setContent(rs.getString("content"));
            board.setResdate(rs.getString("resdate"));
            board.setLev(rs.getInt("lev"));
            board.setCnt(rs.getInt("cnt"));
            boardList.add(board);
        }
    } catch (SQLException e) {
        System.out.println("sql 연결 실패");
        e.printStackTrace();
    } catch (Exception e) {

    } finally {
        con.close(rs, pstmt, conn);
    }
--%>
<body>
<div class="wrap">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <section class="hero is-primary">
        <div class="hero-body">
            <p class="title">
                회원 정보
            </p>
            <p class="subtitle">
            </p>
        </div>
    </section>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="container">
                <div class="page_wrap">
                    <table>
                        <tbody>
                        <tr>
                            <th>아이디 : </th>
                            <td>${member.id}</td>
                        </tr>
                        <tr>
                            <th>이름 : </th>
                            <td>${member.name}</td>
                        </tr>
                        <tr>
                            <th>생일 : </th>
                            <td>${member.birth}</td>
                        </tr>
                        <tr>
                            <th>이메일 : </th>
                            <td>${member.email}</td>
                        </tr>
                        <tr>
                            <th>전화번호 : </th>
                            <td>${member.tel}</td>
                        </tr>
                        </tbody>
                    </table>

                    </table>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
</body>
</html>