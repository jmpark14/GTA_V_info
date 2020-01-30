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
    <%@include file="layout/header.jsp"%>
    <div id="main" style="margin-top: 2%">
        <div class="row">
            <div class="col-md-12">
                <a href="https://www.rockstargames.com/kr/newswire/article/61357/GTA-Online-and-Red-Dead-Online-Have-a-Record-Breaking-Holiday-Season">
                    <img src="https://media.rockstargames.com/rockstargames-newsite/uploads/4a250d786f9ac0be471adec170cd68ea8713247a.jpg" width="100%">
                </a>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-12">
                <h3><strong>빠른 메뉴</strong></h3>
            </div>
        </div>
        <div class="row" style="margin: 2% 0 2% 0">
            <div class="col-md text-center">
                <button type="button" class="btn btn-outline-light" style="margin-right: 10%; font-size: 50px" id="">레이아웃1</button>
                <button type="button" class="btn btn-outline-light" style="margin-right: 10%; font-size: 50px" id="">레이아웃2</button>
                <button type="button" class="btn btn-outline-light" style="font-size: 50px" id="">레이아웃3</button>
            </div>
        </div>
    </div>
    <%@include file="layout/footer.jsp"%>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
