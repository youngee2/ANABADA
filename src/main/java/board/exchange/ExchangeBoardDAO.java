package board.exchange;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class ExchangeBoardDAO extends DBConnPool{
	
	//검색 - 게시물 갯수 반환
		public int selectCount(Map<String, Object> map) {
			int totalCount = 0;

			String query = "select count(*) from exchangeTB";
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
		public List<ExchangeBoardDTO> selectListPage(Map<String, Object> map){
			List<ExchangeBoardDTO> board = new Vector<ExchangeBoardDTO>();
			String query = " " + "select * from("
					+ "		select Tb.*, rownum rNum from("
					+"		select * from exchangeTB ";

			//검색조건
			if(map.get("searchWord") != null) {
				query += " where "+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
			}
			query += "		order by exc_num desc "
					+"		)Tb "
					+" ) "
					+" where rNum between ? and ? ";		

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();

				while(rs.next()) {
					ExchangeBoardDTO dto = new ExchangeBoardDTO();

					dto.setIdx(rs.getInt(1));
					dto.setExc_num(rs.getInt(2));
					dto.setExc_title(rs.getString(3));
					dto.setExc_contents(rs.getString(4));
					dto.setExc_condition(rs.getInt(5));
					dto.setExc_diff(rs.getInt(6));
					dto.setExc_wish(rs.getString(7));
					dto.setUser_picture(rs.getString(8));
					dto.setBoard_num(rs.getInt(9));
					dto.setNickname(rs.getString(10));
					
					board.add(dto);
				}
				System.out.println(map.get("searchWord"));
			System.out.println(query);
			} catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			} return board;
		}

		//일련번호에 해당하는 게시물을 DTO 에 담아 반환하기(글 상세보기)
		public ExchangeBoardDTO selectView(String exc_num) {
			ExchangeBoardDTO dto = new ExchangeBoardDTO();
			String query = "select * from exchangeTB where exc_num = ?";

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1,exc_num);
				rs = psmt.executeQuery();

				if(rs.next()) {
					
					dto.setIdx(rs.getInt(1));
					dto.setExc_num(rs.getInt(2));
					dto.setExc_title(rs.getString(3));
					dto.setExc_contents(rs.getString(4));
					dto.setExc_condition(rs.getInt(5));
					dto.setExc_diff(rs.getInt(6));
					dto.setExc_wish(rs.getString(7));
					dto.setUser_picture(rs.getString(8));
					dto.setBoard_num(rs.getInt(9));
					dto.setNickname(rs.getString(10));
					
				}
			} catch(Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
		
	
		
		
		
}
