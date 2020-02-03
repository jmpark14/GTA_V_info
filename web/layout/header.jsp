<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="row"> <!-- 상단로고/ 로그인, 회원가입 부분-->
        <div class="col-md-8">
            <h1>
                <a href="home.jsp" style="color: #000000">Grand Theft Auto V Information</a>
            </h1>
        </div>
        <div class="col-md-4 text-right" style="margin: 10px 0;">
            <button class="btn btn-outline-danger" type="button" data-toggle="modal" data-target="#loginmodal">로그인</button>
            <button class="btn btn-outline-primary" type="button" id="joinbtn">회원가입</button>
        </div>
    </div>

    <nav class="nav navbar-expand-md navbar-dark bg-dark">
        <ul class="nav navbar-nav nav-fill w-100">
            <li class="nav-item">
                <a class="nav-link" href="../home.jsp">프로젝트 소개</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../about/about.jsp">about</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../board/list.jsp">자유 게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../tip_board/list.jsp">팁&공략</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../member/list.jsp">멤버모집</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../equip/list.jsp">장비공간</a>
            </li>
        </ul>
    </nav>

</header>