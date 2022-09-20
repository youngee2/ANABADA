package board.exchange;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class GetListServiceImpl implements IBoardService{
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ExchangeBoardDAO dao = ExchangeBoardDAO.getInstance();
		List<ExchangeBoardDTO> list = dao.getList();

		req.setAttribute("list",list);
	}
}