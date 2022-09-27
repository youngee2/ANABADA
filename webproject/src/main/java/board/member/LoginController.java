package board.member;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginForm.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		RequestDispatcher rd = req.getRequestDispatcher("/Page/HeaderFooter/LoginForm.jsp");
//		rd.forward(req, resp);
//		// 사용자가 요청한 URL
//		String url = req.getRequestURL().toString();
//
//		// getRequestURL StringBuffer 로 되어있어서 toString으로 변환해 주어야 한다.
//		// 스트링.indexOf("검색어") 검색어를 찾은 위치값, 없으면 -1 리턴
//		if (url.indexOf("LoginForm.do") != -1) {
//
//			// 폼에서 입력한 값
//			String id = req.getParameter("id");
//			String pass = req.getParameter("pass");
//			System.out.println(id + "," + pass);
//
//			MemberDAO dao = new MemberDAO();
//			int name = dao.login(id, pass);
//			System.out.println("이름 : " + name);
//
//			// 로그인 여부
//			String message = new String();
//			String page = new String();
//
//			if (name != 0) {
//				message = name + "님 환영합니다.";
//				page = "/ch02/login_success.jsp";
//
//				// session 객체 인스턴스
//				HttpSession session = req.getSession();
//				session.setAttribute("userid", id);
//				session.setAttribute("message", message);
//			} else {
//				message = "아이디 또는 비밀번호가 일치하지 않습니다.";
//
//				// 로그인 페이지로 돌아감
//				page = "/ch02/login.jsp?message=" + URLEncoder.encode(message, "utf-8");
//			}
//
//			resp.sendRedirect(req.getContextPath() + page);
//
//		} else if (url.indexOf("logout.do") != -1) {
//			// session 객체 만들기
//			HttpSession session = req.getSession();
//
//			// session을 초기화
//			session.invalidate();
//
//			// 로그인 페이지로 되돌아감
//			String message = "로그아웃되었습니다.";
//			resp.sendRedirect(req.getContextPath() + "/ch02/login.jsp?message=" + URLEncoder.encode(message, "utf-8"));
//		}
//	}
//	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		MemberDAO mDao = MemberDAO.getInstance();
		int loginResult = mDao.login(id, pw);

		if (loginResult == 1) {
			req.setAttribute("loginResult", loginResult);
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", id);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/index.jsp");
			rd.forward(req, resp);
		} else {
			req.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/login.jsp");
			rd.forward(req, resp);
		}

	}
//
//		// 폼값을 DTO에 저장
//		MemberDTO dto = new MemberDTO();
//
//		dto.setUser_id(req.getParameter("user_id"));
//		dto.setUser_passwd(req.getParameter("user_passwd"));
//
//		// DAO를 통해 DB에 게시 내용 저장
//		MemberDAO dao = new MemberDAO();
//		int LoginResult = dao.login(req.getParameter("user_id"), req.getParameter("user_passwd"));
//		dao.close();
//
//		// 성공 or 실패?
//		if (LoginResult == 1) {
//			resp.sendRedirect("LoginForm.jsp");
//			System.out.println("로그인 성공");
//		} else {
//			resp.sendRedirect("Header.jsp");
//			System.out.println("로그인 실패");
//		}
//	}

}
