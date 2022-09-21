package Member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do") // 애너테이션으로 요청명과 서블릿 매핑
public class ViewPersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 게시물 불러오기
		MemberDAO dao = new MemberDAO(); // 다오 객체 생성
		String idx = request.getParameter("idx"); // 게시물의 일련번호를 매개변수로 받아

		MemberDTO dto = dao.selectView(idx); // 게시물 내용을 가져온다.
		dao.close();

		// 줄바꿈 처리( HTML 문서는 <br/>로 해야 줄바꿈이 되므로)
		//dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

		// 게시물 저장 후 뷰로 포워드
		request.setAttribute("dto", dto);// DTO 객체를 request 영역에 저장
		request.getRequestDispatcher("/Page/PersonalInformation.jsp").forward(request, response);// View.jsp로 포워드
	}

}
