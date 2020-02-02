<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.gtaBoard" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../jdbc.jsp"%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String countSQL = "select count(brdno) from SCOTT.RVDKDBOARD";

    String pagingSQL = "select * from (select bd.brdno, bd.title, bd.userid, bd.views, bd.regdate, bd.thumbs, rownum as rnum from (select brdno,title,userid,views,regdate, thumbs from SCOTT.RVDKDBOARD order by brdno desc) bd where rownum <= ?) bd2 where bd2.rnum >= ? ";

    List<gtaBoard> lists = null;

    int bdcnt = 0;

    try {
        Class.forName(DRV);
        conn = DriverManager.getConnection(URL, USR, PWD);
        pstmt = conn.prepareStatement(countSQL);

        rs = pstmt.executeQuery();
        if(rs.next()) bdcnt = rs.getInt(1);
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) {rs.close();}
        if (pstmt != null) {pstmt.close();}
        if (conn != null) {conn.close();}
    }

    //게시글이 30개를 넘기면 페이지를 ++함
    int perPage = 20;
    int totalPage = bdcnt / perPage;
    if (bdcnt % perPage > 0) {
        ++totalPage;
    }

    //페이지 넘김 구현
    int cPage = 1;

    try {
        cPage = Integer.parseInt(request.getParameter("cpage"));
    } catch (Exception ex) {}

    //없는 페이지로 가면 에러 창 출력
    if (cPage > totalPage) {
        response.sendRedirect("listerror.jsp");
    }

    //현재 페이지 표시
    int startPage = ((cPage -1) / 10) * 10 + 1; // 현재페이시 표시 공식
    int endPage = startPage + 10 - 1; // 끝페이시 표시 공식

    int startNum = ((cPage-1) * perPage) + 1; // 시작페이지 번호 표시 공식
    int endNum = startNum + perPage - 1; // 끝페이지 번호 표시 공식

    try {
        Class.forName(DRV);
        conn = DriverManager.getConnection(URL, USR, PWD);
        pstmt = conn.prepareStatement(pagingSQL);
        pstmt.setInt(1, endNum);
        pstmt.setInt(2, startNum);

        rs = pstmt.executeQuery();
        lists = new ArrayList<>();
        while (rs.next()) {
            gtaBoard b = new gtaBoard();
            b.setBrdno(rs.getString(1));
            b.setTitle(rs.getString(2));
            b.setUserid(rs.getString(3));
            b.setViews(rs.getString(4));
            b.setRegdate(rs.getString(5));
            b.setThumbs(rs.getString(6));
            lists.add(b);
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) {rs.close();}
        if (pstmt != null) {pstmt.close();}
        if (conn != null) {conn.close();}
    }

    // 글번호 재계산...하나 지워도 맞추도록...갯수
    int brdno = bdcnt - ((cPage-1) * perPage);
%>

<!DOCTYPE html>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src = "https://use.fontawesome.com/2350369b5c.js"></script>
    <title>Grand Theft Auto V - 자유게시판</title>
</head>
<body>

<div class="container">
    <%@include file="../layout/header.jsp"%>
    <div id="main">

    </div>
    <%@include file="../layout/footer.jsp"%>
</div>

</body>
</html>
