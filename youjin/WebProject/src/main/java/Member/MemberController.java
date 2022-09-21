package Member;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Page/SignUp2.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @param application 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp, ServletContext application) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
		
		req.getRequestDispatcher("/Page/SignUp2.jsp").forward(req, resp);

//		// 폼값을 DTO에 저장
//		MemberDTO dto = new MemberDTO();
//
//		dto.setName(req.getParameter("name"));
//		dto.setNickname(req.getParameter("nickname"));
//		dto.setUser_id(req.getParameter("user_id"));
//		dto.setUser_passwd(req.getParameter("user_passwd"));
//		dto.setEmail(req.getParameter("email"));
//		dto.setPhone_num(req.getParameter("phone_num"));
//		dto.setReport(Integer.parseInt(req.getParameter("report")));
//		dto.setUser_picture(req.getParameter("user_picture"));
//
//		// DAO를 통해 DB에 게시 내용 저장
//		MemberDAO dao = new MemberDAO();
//		
//		int result = dao.signUp(dto);
//		dao.close();
//
//		// 성공 or 실패?
//		if (result == 1) { 
//			resp.sendRedirect("./Page/SignUp3.jsp");
//		} else { 
//			resp.sendRedirect("./Page/SignUp2.jsp");
//		}
//	}

}
