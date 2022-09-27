package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	// 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
	public MemberDAO(ServletContext application) {
		super(application);
	}

	// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
	public MemberDTO getMemberDTO(String user_id, String user_passwd) {
		MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
		String query = "SELECT * FROM MEMBERTB WHERE user_id=? AND user_passwd=?";

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, user_id); // 쿼리문의 첫 번째 인파라미터에 값 설정
			psmt.setString(2, user_passwd); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행
			System.out.println(query);
			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_passwd(rs.getString("user_passwd"));
				dto.setEmail(rs.getString(6));
				dto.setPhone_num(rs.getString(7));
				dto.setUser_picture(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 중 오류 발생");
		}

		return dto; // DTO 객체 반환
	}
}
