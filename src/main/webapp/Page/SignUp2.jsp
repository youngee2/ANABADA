<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../Page/Header.jsp"%>


<!DOCTYPE html>
<html lang="ko">

<head>


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>signup_2</title>
<link rel="stylesheet" href="./css/SignUp.css">
<link rel="stylesheet" type="text/css" href="../css/HeaderFooter.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">


</head>

<body>
   <%
   request.setCharacterEncoding("UTF-8");
   String user_id = (String) session.getAttribute("UserId");
   System.out.print(user_id + "확인");

   if (user_id != null) {
      out.println("<script>alert('로그아웃 후 사용해주세요.'); location.href='tradeListPage.do';</script>");
   }
   %>

   <section style="margin: 0 15% 15% 15%">
      <div class="signup_title">회원가입</div>
      <div class="step_title">
         <p>1 약관동의</p>
         <p class="step_point_2">2 정보입력</p>
         <p>3 가입 완료</p>
      </div>
      <hr style="margin-top: 0px">
      <div class="step_ments_1">
         <p class="step_ment_1">회원 정보를 정확히 입력해주세요.</p>
         <p class="step_ment_1">모두 입력하셔야 가입할 수 있습니다.</p>
         <p class="step_ment_1">안 될 시 1:1 문의에 문의해주시길 바랍니다.</p>
      </div>
      <hr>
      <div class="essential_ments">
         <span style="color: red">*</span>필수 입력 정보입니다.
      </div>

      <form name="login" method="post" action="../Page/SignUp2.do"
         onsubmit="return signUpCheck()">
         <div class="form_style">
            <div class="input_style">
               이름&nbsp;<span style="color: red">*</span> <input class="input_body"
                  size=50 maxlength="20" type="text" name="name" placeholder="이름"
                  id="namechk" />
               <div id="nameError" class="error"></div>
            </div>

            <div class="input_style">
               아이디&nbsp;<span style="color: red">*</span>
               <div class="btn-input">
                  <input type="text" id="id" class="input_body" size=50
                     maxlength="20" name="user_id"
                     placeholder="'ID중복검사' 버튼을 눌러 아이디를 입력해주세요." readonly /> <input
                     type="button" name="dbCheckID" id="check_button" value="ID 중복 검사"
                     onclick="idCheck()" />
               </div>
               </p>
               <div id="idError" class="error"></div>
            </div>


            <div class="input_style">
               별명&nbsp;<span style="color: red">*</span>

               <div class="btn-input">
                  <input class="input_body" size=50 maxlength="20" type="text"
                     name="nickname" id="nickname"
                     placeholder="'별명 중복 검사' 버튼을 눌러 아이디를 입력해주세요." readonly /> <input
                     type="button" id="check_button" value="별명 중복 검사"
                     onclick="nicknameCheck()">
               </div>
               </p>
               <div id="nicknameError" class="error"></div>
            </div>


            <div class="input_style">
               비밀번호&nbsp;<span style="color: red">*</span>
               <p style="color: gray">
                  8~15글자 이내 영문, 숫자, 특수문자 조합으로 입력해주세요.<br>[사용 가능한 특수문자 : ! @ # $
                  % ^ & + = ]
               </p>
               <input class="input_body" size=50 maxlength="16" type="password"
                  name="user_passwd" id="pwd"
                  placeholder="비밀번호(8~16자의 영문, 숫자, 특수기호)" />
               <div id="pwdError" class="error"></div>
            </div>

            <div class="input_style">
               비밀번호 확인&nbsp;<span style="color: red">*</span> <input
                  class="input_body" size=50 maxlength="16" type="password"
                  name="password_check" id="pwdChk" placeholder="비밀번호 확인" />
               <div id="pwdChkError" class="error"></div>
            </div>

            <div class="input_style">
               이메일 <input class="input_body" size=50 maxlength="25" type="email"
                  name="e-mail" id="email" placeholder="이메일은 선택사항입니다." />
               <div id="emailError" class="error"></div>
            </div>

            <div class="input_style">
               휴대전화&nbsp;<span style="color: red">*</span> <input
                  class="input_body" size=50 maxlength="13" type="text"
                  name="phone_num" id="phone_num" placeholder="번호는 숫자만 입력해주세요." />
               <div id="phoneNumError" class="error"></div>
            </div>
         </div>
         </tr>
         </table>
         <button type="submit" class="next_btn" id="login" style="width: 100%"
            onclick="signUpCheck()">가입하기</button>
      </form>



      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
         crossorigin="anonymous">
         
      </script>
   </section>
</body>
<%@ include file="./HeaderFooter/Footer.jsp"%>
</html>

  
<script>
   // 가입부분 체크 
   var openWin;
   function idCheck() {
      window.open("IdCheckForm.jsp", "idwin",
            "width=450, height=350, resizable = no, scrollbars = no");
      window.name = "parentForm";
   }
</script>

<script>
   // 가입부분 체크 
   var openWin;
   function nicknameCheck() {
      window.open("NicknameCheckForm.jsp", "idwin",
            "width=450, height=350, resizable = no, scrollbars = no");
      window.name = "parentForm";
   }
</script>

<script>
   // 가입부분 체크 
   function signUpCheck() {
      let namechk = document.getElementById("namechk").value;
      let nickname = document.getElementById("nickname").value;
      let id = document.getElementById("id").value;
      let pwd = document.getElementById("pwd").value;
      let pwdChk = document.getElementById("pwdChk").value;
      let email = document.getElementById("email").value;
      let phone_num = document.getElementById("phone_num").value;
      let check = true;
      let idvalcheck = /^[a-z0-9]+$/
      let pwdcheck = /^[a-zA-Z0-9]+$/

      let num = /[0-9]/
      let eng = /[a-z]/
      let spe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/

      let mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      let pwdOK = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;

      // 이름확인
      if (namechk === "") {
         document.getElementById("nameError").innerHTML = "이름은 필수 정보입니다."
         return false;
      } else if (spe.test(namechk) || namechk.length > 10) {
         document.getElementById("nameError").innerHTML = "이름을 정확히 입력해주세요."
         return false;
      } else {
         document.getElementById("nameError").innerHTML = ""
      }

      //아이디
      if (id === "") {
         document.getElementById("idError").innerHTML = "아이디는 필수 정보입니다."
         return false;
      } else {
         document.getElementById("idError").innerHTML = "멋진 아이디네요!"
      }

      //닉네임
      if (nickname === "") {
         document.getElementById("nicknameError").innerHTML = "별명은 필수 정보입니다."
         return false;
      } else {
         document.getElementById("nicknameError").innerHTML = "멋진 별명이네요!"
      }

      // 비밀번호 확인
      if (pwd === "") {
         document.getElementById("pwdError").innerHTML = "비밀번호를 입력해주세요."
         return false;
      } else if (pwdOK.test(pwd)) {
         document.getElementById("pwdError").innerHTML = "8~15자의 영문, 숫자, 특수문자 조합으로 입력해주세요."
         return false;
      } else {
         document.getElementById("passwordError").innerHTML = ""
      }

      if (pwd !== pwdChk) {
         document.getElementById("pwdError").innerHTML = ""
         document.getElementById("pwdChkError").innerHTML = "비밀번호가 동일하지 않습니다."
         return false;
      } else {
         document.getElementById("pwdError").innerHTML = ""
         document.getElementById("pwdChkError").innerHTML = ""
      }

      if (pwdChk === "") {
         document.getElementById("pwdChkError").innerHTML = "비밀번호를 다시 입력해주세요."
         return false;
      } else {
         document.getElementById("passwordCheckError").innerHTML = ""
      }

      if (email === "") {
         document.getElementById("emailError").innerHTML = ""
      } else if ((email.match(mailCheck) == null)) {
         document.getElementById("emailError").innerHTML = "이메일을 정확히 입력해주세요."
         return false;
      } else {
         document.getElementById("emailError").innerHTML = ""
      }

      //전화번호
      if (phone_num === "") {
         document.getElementById("phoneNumError").innerHTML = "전화번호는 필수 정보입니다."
         return false;
      } else if (num.test(phone_num) || id.length < 12) {
         document.getElementById("phoneNumError").innerHTML = "전화번호는 숫자만 입력해주세요."
         return false;
      } else {
         document.getElementById("phoneNumError").innerHTML = ""
      }

   }
</script>