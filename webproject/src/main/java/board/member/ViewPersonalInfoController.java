package board.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/PersonalInformation.do")
public class ViewPersonalInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("UserId");
		 
		// 게시물 불러오기
		MemberDAO dao = new MemberDAO(); // 다오 객체 생성
		MemberDTO dto = dao.PersonalInfo(user_id); // 게시물 내용을 가져온다.
		dao.close();

		// 게시물 저장 후 뷰로 포워드
		req.setAttribute("dto", dto);// DTO 객체를 request 영역에 저장
		req.getRequestDispatcher("../Page/PersonalInformation.jsp").forward(req, resp);
	}

}
