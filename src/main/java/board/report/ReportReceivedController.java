package board.report;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.member.MemberDAO;
import board.member.MemberDTO;

@WebServlet("/Page/ReportReceived.do")
public class ReportReceivedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();

		int idx = Integer.parseInt(req.getParameter("idx"));
		String reporterNickname = (String) session.getAttribute("Nickname");
		String reportedNickname = req.getParameter("reportedNickname");

		ReportDTO reportdto = new ReportDTO();
		reportdto.setIdx(idx); // idx
		reportdto.setReportedNickname(req.getParameter("reportedNickname")); // 피신고자 닉네임
		reportdto.setReporterNickname(reporterNickname); // 신고자 닉네임
		reportdto.setReason(req.getParameter("reason")); // 신고 사유

		ReportDAO reportdao = new ReportDAO();
		int result = reportdao.reportReceived(reportdto);

		// 만약 신고한 적이 있다면?
		boolean reporterResult = reportdao.reporterIdxCheck(reporterNickname, reportedNickname);
		reportdao.close();

		// 총 신고수 업데이트
		MemberDAO dao = new MemberDAO();
		dao.totalReportCount(reportedNickname, reportedNickname);
		dao.close();

		String referer = req.getHeader("Referer");

		if (result == 1) {
			resp.sendRedirect(referer);
			System.out.println("신고 접수 완료");
		} else {
			resp.sendRedirect("ReportReceived.jsp");
			System.out.println("신고 접수 실패");
		}
	}

}