package board.exchange;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
			query += "		order by idx desc "
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

					board.add(dto);
				}
			} catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			} return board;
		}

		
		
		
		public List<ExchangeBoardDTO> getList(){
			List<ExchangeBoardDTO> list = new ArrayList<>();
			String sql = "select * from exchangeTB oredr by exc_num desc";
			
			try {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					ExchangeBoardDTO dto = new ExchangeBoardDTO();
					
					dto.setIdx(rs.getInt("idx"));
					dto.setExc_num(rs.getInt("exc_num"));
					dto.setExc_title(rs.getString("exc_title"));
					dto.setExc_contents(rs.getString("exc_contents"));
					dto.setExc_condition(rs.getInt("exc_condition"));
					dto.setExc_diff(rs.getInt("exc_diff"));
					dto.setExc_wish(rs.getString("exc_wish"));
					dto.setUser_picture(rs.getString("user_picture"));
					dto.setBoard_num(rs.getInt("board_num"));
					
					list.add(dto);
					
				}
				System.out.println(sql);
			}catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			} finally {
				close();
			}
			return list;
		}
		
		
		
		
}
