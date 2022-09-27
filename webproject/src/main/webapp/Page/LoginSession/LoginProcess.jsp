<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 로그인 폼으로부터 받은 아이디와 패스워드
String UserId = request.getParameter("user_id");
String userPwd = request.getParameter("user_passwd");

// web.xml에서 가져온 데이터베이스 연결 정보
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(UserId, userPwd);
dao.close();

// 로그인 성공 여부에 따른 처리
if (memberDTO.getUser_id() != null) {
	// 로그인 성공
	session.setAttribute("UserId", memberDTO.getUser_id());
	session.setAttribute("Idx", memberDTO.getIdx());
	session.setAttribute("Nickname", memberDTO.getNickname());
	response.sendRedirect("../tradeListPage.jsp");

} else {
	// 로그인 실패
	//request.setAttribute("LoginErrMsg", "아이디/비밀번호를 확인 후 다시 로그인 해주세요.");
	request.getRequestDispatcher("../tradeListPage.jsp").forward(request, response);
}
%>