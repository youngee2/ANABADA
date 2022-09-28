<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%
CommentDAO dao = new CommentDAO(application);
CommentDTO dto = new CommentDTO();
int titleNum = Integer.parseInt(request.getParameter("titleNum"));
String comment = request.getParameter("comment");
String nickname = (String) session.getAttribute("Nickname");

dto.setComm(comment);
dto.setNickname(nickname);
dto.setTitle_num(titleNum);

int delresult = dao.delete_exc_Comment(dto);

if(delresult == 1){
	response.sendRedirect("../exchangePage.do?exc_num="+titleNum);
} else{
	out.print(comment);
	out.print(nickname);
	
}
dao.close();
%>