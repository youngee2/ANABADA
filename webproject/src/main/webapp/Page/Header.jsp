<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="utils.CookieManager"%>

<%
String loginId = CookieManager.readCookie(request, "loginId");

String cookieCheck = "";
if (!loginId.equals("")) {
   cookieCheck = "checked";
}
%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
<script src="https://kit.fontawesome.com/e4982ae3c4.js"
   crossorigin="anonymous"></script>
<link
   href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
   rel="stylesheet">

</head>
<!DOCTYPE html>
<html lang="ko">

<head>
<body>
   <!--헤더 부분-->
   <header class="header">
      <div class="HeaderA">
         <ul class="login">

            <%
            if (session.getAttribute("UserId") == null) {
            %>
            <li class="btn LoginBtn"><a href="#">Login</a></li>
            <div class="modal">
               <div class="login-modal">

                  <span class="close">&times;</span>
                  <div class="Login_form">
                     <h3>Login to ANABADA</h3>

                     <div class="modal-margin">
                        <form action="../Page/Header.do" method="post" name="loginFrm"
                           onsubmit="return validateForm(this);">
                           <div class="form-group">
                              <input type="text" name="user_id" required /><label>ID</label>
                           </div>
                           <div class="form-group">
                              <input type="password" name="user_passwd" required /><label>Password</label>
                              <span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("ErrMsg") == null ? "" : request.getAttribute("ErrMsg")%>
                              </span>
                           </div>
                           <div class="GoSignUp">
                              <input type="submit" value="Login" class="submit"
                                 id="btnLogin" onclick="insertReplyFunc();">
                              <p>
                                 Not Yet Registered? <a href="../Page/SignUp1.jsp">Sign Up</a>
                              </p>
                           </div>
                        </form>


                        <script>
                           function validateForm(form) {
                              if (!form.user_id.value) {
                                 alert("아이디를 입력하세요.");
                                 return false;
                              }
                              if (form.user_pw.value == "") {
                                 alert("패스워드를 입력하세요.");
                                 return false;
                              }
                           }
                        </script>
                     </div>
                  </div>
               </div>
            </div>
            <%
            } else {
            %>
            <li><a href="../Page/LoginSession/Logout.jsp">LOGOUT</a></li>
            <li><a href="../Page/PersonalInformation.do">MY PAGE</a> <%
 }
 %>
         </ul>
      </div>
      <script>
         function check_onclick() {
            theForm = document.Login;

            if (theForm.login.value == "" || theForm.password.value == "") {
               alert("아이디 혹은 비밀번호를 입력해주세요.");
            }
         }
      </script>

      <div class="HeaderB">
         <img class="LogoImg" src="./img/LogoPolarBear.png"> <span><a
            href="#"> 아나바다</a></span>
      </div>

      <div class="HeaderC">

         <ul class="subA">
            <li><a href="#">아나바다란?</a>
               <ol class="subDetailA">
                  <li><a href="#">회사소개</a></li>
                  <li><a href="#">개발자</a></li>
               </ol></li>
         </ul>

         <ul class="subB">
            <li><a href="./tradeListPage.do">거래하기</a>
               <ol class="subDetailB">
                  <li><a href="#">전체</a></li>
                  <li><a href="#">테크/가전</a></li>
                  <li><a href="#">패션/잡화/뷰티</a></li>
                  <li><a href="#">홈/리빙</a></li>
                  <li><a href="#">베이비/키즈</a></li>
                  <li><a href="#">반려동물</a></li>
                  <li><a href="#">게임/취미/문화</a></li>
                  <li><a href="#">기타</a></li>
               </ol></li>
         </ul>

         <ul class="subC">
            <li><a href="./exchangeListPage.do">교환</a></li>
         </ul>
         <ul class="subD">
            <li><a href="../Page/freeListPage.do">자유게시판</a></li>
         </ul>
         <ul class="subE">
            <li><a href="./donationPage.jsp">후원하기</a></li>
         </ul>

         <ul class="subF">
            <li><a href="../Page/faqListPage.do">고객센터</a>
               <ol class="subDetailF">
                  <li><a href="#">F&Q</a></li>
                  <li><a href="#">1대1 문의</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
               </ol></li>
         </ul>
      </div>
      <script>
         var modals = document.getElementsByClassName("modal");
         var btns = document.getElementsByClassName("btn");
         var spanes = document.getElementsByClassName("close");
         var funcs = [];

         function Modal(num) {
            return function() {
               btns[num].onclick = function() {
                  modals[num].style.display = "block";
                  console.log(num);
               };

               spanes[num].onclick = function() {
                  modals[num].style.display = "none";
               };
            };
         }

         for (var i = 0; i < btns.length; i++) {
            funcs[i] = Modal(i);
         }

         for (var j = 0; j < btns.length; j++) {
            funcs[j]();
         }

         window.onclick = function(event) {
            if (event.target.className == "modal") {
               event.target.style.display = "none";
            }
         };
      </script>