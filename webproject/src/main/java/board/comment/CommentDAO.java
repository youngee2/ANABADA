package board.comment;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class CommentDAO extends JDBConnect{
	public CommentDAO(ServletContext application) {
		super();
	}


	//교환 게시판 댓글 가져오기
	public List<CommentDTO> select_exc_comm_List(int titlenum){
		List<CommentDTO> list = new Vector<CommentDTO>();
		String sql = "select * from CommentTB where board_num=0 and title_num ="+titlenum;

		try {
			stmt =  con.createStatement();
			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setIdx(rs.getInt("idx"));
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setTitle_num(rs.getInt("title_num"));
				dto.setComm(rs.getString("comm"));
				dto.setNickname(rs.getString("nickname"));
				dto.setComm_date(rs.getDate("comm_date"));

				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("교환 게시판 댓글 조회 중 오류");
		}
		return list;
	}


	//게시판 댓글 작성하기 
	public int commentWrite(CommentDTO dto) {
		int result = 0;
		try {
			String sql = "insert into commentTB("
					+ "idx, board_num, title_num, comm, nickname) "
					+ "values ("
					+ "?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getIdx());
			psmt.setInt(2, dto.getBoard_num());
			psmt.setInt(3, dto.getTitle_num());
			psmt.setString(4, dto.getComm());
			psmt.setString(5, dto.getNickname());

			result = psmt.executeUpdate();
			System.out.println(result);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시판 댓글 작성 중 오류");
		}
		return result;
	}

	//교환 게시판 댓글 삭제하기
	public int delete_exc_Comment(CommentDTO dto) {
		int result = 0;
		try {
			String sql = "delete from commentTB where comm=? and nickname=? and title_num=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getComm());
			psmt.setString(2, dto.getNickname());
			psmt.setInt(3, dto.getTitle_num());
			
			result = psmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("댓글 삭제 중 오류");
		}
		return result;
	}

}
