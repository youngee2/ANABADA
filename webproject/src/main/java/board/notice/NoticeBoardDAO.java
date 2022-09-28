package board.notice;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class NoticeBoardDAO extends DBConnPool {
	public NoticeBoardDAO() {
		super();
	}

	// 조건에 맞는 게시물의 개수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM noticeTB ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 실행
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount; // 게시물 개수 서블릿으로 반환
	}

	public List<NoticeBoardDTO> selectListPage(Map<String, Object> map) {
		List<NoticeBoardDTO> board = new Vector<NoticeBoardDTO>();

		String query = " " + "SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( " + " SELECT * FROM NOTICETB ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " ORDER BY n_num DESC " + " )Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			// 반환된 게시물 목록을 List 컬렉션에 추가
			while (rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();

				dto.setN_num(rs.getInt(1));
				dto.setN_title(rs.getString(2));
				dto.setN_date(rs.getDate(3));
				dto.setN_count(rs.getInt(4));
				dto.setN_content(rs.getString(5));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board; // 목록 반환
	}

	// 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환
	public NoticeBoardDTO selectView(String n_num) {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		String query = "SELECT * FROM noticetb where n_num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, n_num);
			rs = psmt.executeQuery(); // 쿼리문 실행

			if (rs.next()) {
				dto.setN_num(rs.getInt(1));
				dto.setN_title(rs.getString(2));
				dto.setN_date(rs.getDate(3));
				dto.setN_count(rs.getInt(4));
				dto.setN_content(rs.getString(5));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킴.
	
	public void updateVisitCount(String n_num) {
		String query="UPDATE noticeTB SET "
				+ " n_count= n_count+1 "
				+" where n_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, n_num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
}