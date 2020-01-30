<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src = "https://use.fontawesome.com/2350369b5c.js"></script>
    <title>Grand Theft Auto V - Home</title>
</head>
<body>

<div class="container" >
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

    </header>
    <div id="main">
        <div>
            <p>메인 부분</p>
        </div>
    </div>

    <footer>
        <p class="text-right card card-body bg-light" style="padding:10px 5px; border: 1px solid silver">
            <small>
                &copy; Grand Theft Auto V Information. Powered by jmbuddy. All Rights Reserved.
            </small>
        </p>
    </footer>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
