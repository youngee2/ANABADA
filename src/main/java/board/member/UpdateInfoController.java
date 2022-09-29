package board.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/UpdateInfo.do")
public class UpdateInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("UserId");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.PersonalInfo(user_id);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Page/UpdateInfo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		// 폼값을 DTO에 저장
		MemberDTO dto = new MemberDTO();

		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String user_passwd = req.getParameter("user_passwd");
		String email = req.getParameter("email");
		String phone_num = req.getParameter("phone_num");
		String user_id = req.getParameter("user_id");
		
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setUser_passwd(user_passwd);
		dto.setEmail(email);
		dto.setPhone_num(phone_num);
		dto.setUser_id(user_id);
		System.out.println(name + nickname + user_passwd + email + phone_num + user_id);

		// DAO를 통해 DB에 게시 내용 저장
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(name, nickname, user_passwd, email, phone_num, user_id);
//		MemberDTO memberDTO = dao.getMemberDTO(req.getParameter("name"), req.getParameter("nickname"),
//				req.getParameter("user_passwd"), req.getParameter("email"), req.getParameter("phone_num"),
//				req.getParameter("user_id"));
		dao.close();

		// 성공 or 실패?
		if (memberDTO.getUser_id() != null) {
			resp.sendRedirect("PrsonalInfomation.do");
			System.out.println("개인정보 수정 성공");
		} else {
			resp.sendRedirect("UpdateInfo.do");
			System.out.println("개인정보 수정 실패");
		}

	}
}
