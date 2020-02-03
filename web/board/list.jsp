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

    String countSQL = "select count(brdno) from SCOTT.GTABOARD";

    String pagingSQL = "select * from (select bd.brdno, bd.title, bd.userid, bd.views, bd.regdate, bd.thumbs, rownum as rnum from (select brdno,title,userid,views,regdate, thumbs from SCOTT.GTABOARD order by brdno desc) bd where rownum <= ?) bd2 where bd2.rnum >= ? ";

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
    <div id="main" style="margin: 2% 0">
        <div>
            <i class="fas fa-comments-o fa-2x">자유게시판</i>
        </div>
        <div class="text-right"><%--글쓰기 아이콘--%>
            <a href="write.jsp"><i class="fas fa-edit"></i></a>
        </div>
        <div class="row"><%--게시판--%>
            <div class="col">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>추천</th>
                        <th>조회</th>
                    </tr>
                    </thead>
                    <tbody>
                        <% try {
                            for(gtaBoard b : lists) { %><%-- 동적배열에 저장된 값들(lists)을 요소별(b)로 계속 출력 --%>
                        <tr>
                            <td><%=brdno-- %></td>
                            <td><a href="view.jsp?brdno=<%=b.getBrdno()%>"><%=b.getTitle()%></a></td>
                            <td><%=b.getUserid() %></td>
                            <td><%=b.getRegdate() %></td>
                            <td><%=b.getThumbs() %></td>
                            <td><%=b.getViews() %></td>
                        </tr>
                        <% }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }%>
                        <%
                            if (lists == null || lists.isEmpty()) {
                                out.println("<tr><td></td>" +
                                        "<td class=\"text-right\">등록된 게시물이 없습니다.</td>" +
                                        "<td></td>" +
                                        "<td></td>" +
                                        "<td></td>" +
                                        "<td></td><tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="text-right"> <!-- 글쓰기 버튼 -->
            <button type="button" class="btn btn-primary" id="write">글쓰기</button>
        </div>

        <div align="center">
            <% if (cPage > 10)
                out.print("<sapn><a href='list.jsp?cpage=" + (startPage-1) + "'>이전</a>&nbsp;</span>"); %>
            <% for (int i = startPage; i <= endPage; ++i) { %>
            <% if (i > totalPage) break;
                if (cPage == i) out.print("<span style='color:red'>" + i + "&nbsp;</span>"); // 현재 페이지에는 링크 x
                else out.print("<span><a href='list.jsp?cpage=" + i + "'>" + i + "</a>&nbsp;</span>");
            %>
            <% } %>
            <% if (endPage < totalPage)
                out.print("<span>a href = 'list.jsp?cpage=" + (endPage+1) + "'>다음</a>&nbsp;</span>"); %>
        </div>

        <div class="form-group row justify-content-center"><!-- 게시물 검색 -->
            <div class="w100">
                <select class="form-control form-control" name="searchType" id="searchType">
                    <option value="title">제목</option>
                    <option value="content">본문</option>
                    <option value="reg_id">작성자</option>
                </select>
            </div>
            <div class="w300">
                <input type="text" class="form-control form-control" name="keyword" id="keyword">
            </div>
            <div>
                <button class="btn btn-primary" name="btnSearch" id="btnSearch">검색</button>
            </div>
        </div>
    </div>
    <%@include file="../layout/footer.jsp"%>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
