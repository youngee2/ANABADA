<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%
CommentDAO dao = new CommentDAO(application);
CommentDTO dto = new CommentDTO();

int titleNum = Integer.parseInt(request.getParameter("title_num1"));
String comment = request.getParameter("comm_contents1").toString();
String nickname = (String) session.getAttribute("Nickname");

dto.setComm(comment);
dto.setNickname(nickname);
dto.setTitle_num(titleNum);

int delresult = dao.free_delete_Comment(dto);
if(delresult == 1){
	response.sendRedirect("../freeboard_read.jsp?free_num="+titleNum);

}
dao.close();
%>