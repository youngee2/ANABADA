<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.member.MemberDAO"%>
<%@ page import="board.member.MemberDTO"%>
<%@ page import="utils.SHA256"%>
<!-- 특정한 스크립트 구문을 설정할 때 사용한다.  -->
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("UTF-8");

//사용자가 입력하는 3가지 값.
String userID = null;
String userPassword = null;
String userEmail = null;

//사용자가 userID값을 입력했다면, 
if (request.getParameter("userID") != null) {
	//userID에 데이터를 담아준다.
	userID = (String) request.getParameter("userID");
}

if (request.getParameter("userPassword") != null) {
	userPassword = (String) request.getParameter("userPassword");
}

if (request.getParameter("userEmail") != null) {
	userEmail = (String) request.getParameter("userEmail");
}

//사용자가 정상적으로 입력하지 않았다면,
if (userID == null || userPassword == null || userEmail == null) {

	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.');");
	script.println("history.back();");
	script.println("</script>");

	script.close();
} else { //사용자가 재대로 입력을 했다면, 

	MemberDAO dao = new MemberDAO();
	//모든 결과값을 result에 넣어준다. (한명의 사용자객체를 회원가입을 시켜준다.)
	int result = dao.SignUp(new MemberDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));

	if (result == -1) {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");

		script.close();

	} else {
		//로그인을 시켜준다.
		session.setAttribute("userID", userID);

		PrintWriter script = response.getWriter();

		script.println("<script>");
		//이메일 인증 페이지로 보낸다.
		script.println("location.href = 'emailSendAction.jsp';");
		script.println("</script>");

		script.close();

	}

}
%>
