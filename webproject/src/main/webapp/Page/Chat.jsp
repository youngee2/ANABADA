<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=550px;">
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="./css/style-jieun.css">

    <title>채팅창</title>
</head>

<body style="background-image: url('./img/background.png'); ">
    <!--대화 상대-->

    <div class="chat who">
        (닉네임)
    </div>
    <!--채팅창-->
    <div class="chat-display">
        <!--자신의 채팅-->
        <div class="Message my">
            테스트
        </div>


        <!--상대방의 채팅-->
        <div class="Message you">테스트2</div>

    </div>


    <!--채팅 입력-->
    <div class="chat input">
        <input type="text" class="input-chatbox" placeholder="최대 500자">
        <button class="chat-btn btnFade btnOrange" style="margin: 0;">보내기</button>
    </div>





</body>

</html>