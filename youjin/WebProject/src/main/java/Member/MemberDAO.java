package Member;

import javax.servlet.ServletContext;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

//	public MemberDAO(String drv, String url, String id, String pw) {
//		super(drv, url, id, pw);
//	}
//
	public MemberDAO() {
		super();
	}

	// 회원가입
	public int signUp(MemberDTO dto) {
		int result = 0;

		String query = "INSERT INTO memberTB ( "
				+ " idx, name, nickname, user_id, user_passwd, email, phone_num, report, user_picture) " + " VALUES ( "
				+ " seq_board_num.NEXTVAL,?,?,?,?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getUser_id());
			psmt.setString(4, dto.getUser_passwd());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getPhone_num());
			psmt.setInt(7, dto.getReport());
			psmt.setString(8, dto.getUser_picture());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 회원정보 불러오기
	public MemberDTO selectView(String idx) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBERTB WHERE idx=?"; // 쿼리문 템플릿 준비

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();

			if (rs.next()) { // 결과를 DTO 객체에 저장
//				psmt.setString(1, dto.getName());
//				psmt.setString(2, dto.getNickname());
//				psmt.setString(3, dto.getUser_id());
//				psmt.setString(4, dto.getUser_passwd());
//				psmt.setString(5, dto.getEmail());
//				psmt.setString(6, dto.getPhone_num());
//				psmt.setInt(7, dto.getReport());
//				psmt.setString(8, dto.getUser_picture());

				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_passwd(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setPhone_num(rs.getString(7));
				dto.setReport(rs.getInt(8));
				dto.setUser_picture(rs.getString(9));
			}
		} catch (Exception e) {
			System.out.println("회원 정보 불러오기 오류");
			e.printStackTrace();
		}
		return dto;
	}
}