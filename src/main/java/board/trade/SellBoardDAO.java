package board.trade;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import common.DBConnPool;

public class SellBoardDAO extends DBConnPool{
	
	//검색 - 게시물 갯수 반환
		public int selectCount(Map<String, Object> map) {
			int totalCount = 0;

			String query = "select count(*) from sellTB";
			if(map.get("searchWord") != null) {
				query += " where " + map.get("searchField")+" "+" like '%"+map.get("searchWord")+"%'";
			}
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				totalCount = rs.getInt(1);

			} catch(Exception e) {
				System.out.println("게시물 카운트 중 예외 발생");
				e.printStackTrace();
			}
			return totalCount;
		}

		
		// 검색 - 게시물 목록 반환(페이징)
		public List<SellBoardDTO> selectListPage(Map<String, Object> map){
			List<SellBoardDTO> board = new Vector<SellBoardDTO>();
			String query = " " + "select * from("
					+ "		select Tb.*, rownum rNum from("
					+"		select * from sellTB ";

			//검색조건
			if(map.get("searchWord") != null) {
				query += " where "+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
			}
			query += "		order by sell_num desc "
					+"		)Tb "
					+" ) "
					+" where rNum between ? and ? ";		

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();

				while(rs.next()) {
					SellBoardDTO dto = new SellBoardDTO();

					dto.setIdx(rs.getInt(1));
					dto.setSell_num(rs.getInt(2));
					dto.setSell_title(rs.getString(3));
					dto.setSell_contents(rs.getString(4));
					dto.setSell_category(rs.getInt(5));
					dto.setSell_price(rs.getInt(6));
					dto.setUser_picture(rs.getString(7));
					dto.setBoard_num(rs.getInt(8));
					dto.setSell_condition(rs.getInt(9));
					dto.setNickname(rs.getString(10));
					
					
					board.add(dto);
				}
			} catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			} return board;
		}

		//일련번호에 해당하는 게시물을 DTO 에 담아 반환하기(글 상세보기)
		public SellBoardDTO selectView(String exc_num) {
			SellBoardDTO dto = new SellBoardDTO();
			String query = "select * from sellTB where sell_num = ?";

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1,exc_num);
				rs = psmt.executeQuery();

				if(rs.next()) {
					

					dto.setIdx(rs.getInt(1));
					dto.setSell_num(rs.getInt(2));
					dto.setSell_title(rs.getString(3));
					dto.setSell_contents(rs.getString(4));
					dto.setSell_category(rs.getInt(5));
					dto.setSell_price(rs.getInt(6));
					dto.setUser_picture(rs.getString(7));
					dto.setBoard_num(rs.getInt(8));
					dto.setSell_condition(rs.getInt(9));
					dto.setNickname(rs.getString(10));
					
					
				}
			} catch(Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
		
	//게시글 DB에 저장하기 (idx,nickname 수정요망-로그인한 회원 받아와야함)
		public int insertWrite(SellBoardDTO dto) {
			int result = 0;
			try {
				String query = "insert into sellTB ("
						+"idx, sell_num, sell_title, sell_contents, sell_category, sell_price, user_picture, board_num, sell_condition, nickname)"
						+" values (0, seq_board.NEXTVAL, ?,?,?,?,?,0,?,'홍길동')";

				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getSell_title());
				psmt.setString(2, dto.getSell_contents());
				psmt.setInt(3, dto.getSell_category());
				psmt.setInt(4, dto.getSell_price());
				psmt.setString(5, dto.getUser_picture());
				psmt.setInt(6, dto.getSell_condition());
				
				result = psmt.executeUpdate();
			}catch(Exception e) {
				System.out.println("게시물 입력 중 예외 발생");
				e.printStackTrace();
			}return result;
		}
		
		
		
}
