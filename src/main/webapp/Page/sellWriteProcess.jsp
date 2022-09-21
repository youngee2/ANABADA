<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.trade.SellBoardDAO"%>
<%@ page import="board.trade.SellBoardDTO"%>
<%
String title = (String) pageContext.getAttribute("sell_title");
String contents = (String) pageContext.getAttribute("sell_contents");

if(title != null){
	title = title.split("=")[1];
}else{
	title ="x_x";
}

if(contents == null){
	contents = "이거 오류";
}

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