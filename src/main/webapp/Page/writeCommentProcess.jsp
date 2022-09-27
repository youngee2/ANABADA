<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%
String content = request.getParameter("content");
int titleNum = Integer.parseInt(request.getParameter("titleNum"));

CommentDTO dto = new CommentDTO();
dto.setComm(content);
dto.setTitle_num(titleNum);

CommentDAO dao = new CommentDAO(application);
int result = dao.commentWrite(dto);
dao.close();

if(result == 1){
	response.sendRedirect("../Page/exchangePage.do?exc_num="+titleNum);
}

%>