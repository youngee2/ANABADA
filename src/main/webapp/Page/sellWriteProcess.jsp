<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.trade.SellBoardDAO"%>
<%@ page import="board.trade.SellBoardDTO"%>
<%
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String contents = request.getParameter("contents");

SellBoardDTO dto = new SellBoardDTO();
dto.setSell_title(title);
dto.setSell_contents(contents);

SellBoardDAO dao = new SellBoardDAO();
int result = dao.insertWrite(dto);
dao.close();

if(result == 1 ){
 response.sendRedirect("../Page/tradeListPage.do");
}else {
}
%>