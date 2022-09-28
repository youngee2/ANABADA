package board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeBoardWriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FreeBoardWriteController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Page/freeboard_write.jsp").forward(req, resp);
		FreeBoardDTO dto = new FreeBoardDTO();

		dto.setFree_title(req.getParameter("title"));
		dto.setFree_contents(req.getParameter("contents"));

		FreeBoardDAO dao = new FreeBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

//		if (result == 1) {
//			resp.sendRedirect("../Page/freeListPage.do");
//		} else {
//			resp.sendRedirect("../Page/FreeBoardWrite.do");
//		}
	}

}
