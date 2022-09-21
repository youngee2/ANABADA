package board.trade;


import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

@WebServlet("/Page/tradeListPage.do")
public class SellListController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public SellListController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		SellBoardDAO dao = new SellBoardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
			
		}
		
		int totalCount = dao.selectCount(map);
	
		
		//페이지 처리
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		int start = (pageNum -1) * pageSize +1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		
	
		//게시물 목록 받기
		List<SellBoardDTO> boardList = dao.selectListPage(map);
		dao.close();
		
		
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/webproject/Page/tradeListPage.do");
		
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		//전달할 데이터를 req영역에 저장 후 포워드
		req.setAttribute("boardList", boardList);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/Page/tradeListPage.jsp").forward(req, resp);
		
	
	}

}
