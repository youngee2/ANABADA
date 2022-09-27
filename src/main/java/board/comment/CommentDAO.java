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
	public List<CommentDTO> selectList(int titlenum){
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


	//교환 게시판 댓글 작성하기 (idx,닉네임 수정해야함)
	public int commentWrite(CommentDTO dto) {
		int result = 0;
			try {
				String sql = "insert into commentTB("
						+ "idx, board_num, title_num, comm, nickname) "
						+ "values ("
						+ "0, 0, ?, ?, '테스트')";
				
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, dto.getTitle_num());
				psmt.setString(2, dto.getComm());
				
				result = psmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("교환 게시판 댓글 작성 중 오류");
			}
		return result;
	}
	
}
