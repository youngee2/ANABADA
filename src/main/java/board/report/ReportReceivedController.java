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

		int reporterIdx = (int) session.getAttribute("Idx");
		
		
		ReportDTO reportdto = new ReportDTO();
		 reportdto.setIdx(Integer.parseInt(req.getParameter("idx1")));
		reportdto.setReporterIdx(reporterIdx);
		reportdto.setReason(req.getParameter("reason"));

		ReportDAO reportdao = new ReportDAO();
		int result = reportdao.reportReceived(reportdto);
		
		boolean reporterResult = reportdao.reporterIdxCheck(reporterIdx);
		reportdao.close();

		if (reporterResult == true) {
			resp.sendRedirect("PersonalInformation.do");
			System.out.println("신고 접수가 이미 완료되었습니다.");
		}
		else if (result == 1) {
			resp.sendRedirect("PersonalInformation.do");
			System.out.println("신고 접수 완료");
		} else {
			resp.sendRedirect("ReportReceived.jsp");
			System.out.println("신고 접수 실패");
		}

	}
}
