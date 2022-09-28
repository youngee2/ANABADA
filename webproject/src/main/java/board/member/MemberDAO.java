package board.member;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
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
//	public int Login(String user_id, String user_passwd) {
//		String query = "SELECT * FROM MEMBERTB WHERE user_id =? AND user_passwd=?";
//
//		try {
//			// 쿼리 실행
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, user_id);
//			psmt.setString(2, user_passwd);
//			rs = stmt.executeQuery(query);
//			System.out.println(query);
//			// 결과 처리
//			if (rs.next()) {
//				if (rs.getString(1).contentEquals(user_passwd)) {
//					System.out.println("로그인성공");
//					return 1; // 로그인 성공
//
//				} else {
//					System.out.println("비밀번호 불일치");
//					return 0; // 비밀번호 불일치
//				}
//			}
//			System.out.println("아이디가 없음");
//			return -1; // 아이디가 없음
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(" DB 오류");
//		return -2; // DB 오류
//	}

	// 아이디 중복확인
	public boolean IDCheck(String id) { // 회원정보 id를 받기
		try {
			String query = "SELECT * FROM MEMBERTB WHERE user_id=?";
			System.out.println("SQL : " + query);
			rs = stmt.executeQuery(query);
			rs.last();
			System.out.println("rs.getRow() : " + rs.getRow()); // getRow 열과번호. a가 몇번재? 4번으로 출력
			// 검색안되면 0이된다. 번호가 1부터 시작 ....
			if (rs.getRow() == 0) {
				System.out.println("0 row selected..."); // 0이면 없는걸로 취급돼서
			} else {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	// 회원가입

	public int signUp(MemberDTO dto) {
		int result = 0;

		String query = "INSERT INTO memberTB ( "
				+ " idx, name, nickname, user_id, user_passwd, email, phone_num, user_picture) " + " VALUES ( "
				+ " seq_board_num.NEXTVAL,?,?,?,?,?,?,?)";

		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getUser_id());
			psmt.setString(4, dto.getUser_passwd());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getPhone_num());
			psmt.setString(7, dto.getUser_picture());
			result = psmt.executeUpdate();

			System.out.println(query);
		} catch (Exception e) {
			System.out.println("signUp 회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 회원정보 불러오기
	public MemberDTO PersonalInfo(String user_id) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBERTB WHERE user_id=?"; // 쿼리문 템플릿 준비

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			if (rs.next()) { // 결과를 DTO 객체에 저장

				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_passwd(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setPhone_num(rs.getString(7));
				dto.setReport(rs.getInt(8));
				dto.setUser_picture(rs.getString(9));
				System.out.println(query);

			}
		} catch (Exception e) {
			System.out.println("회원 정보 불러오기 오류");
			e.printStackTrace();
		}
		return dto;
	}

	// 회원 정보 수정하기
	   public MemberDTO getMemberDTO(String name, String nickname, String user_passwd, String email, String phone_num,
	         String user_id) {

	      MemberDTO dto = new MemberDTO();
	      try {
	         String query = "UPDATE MEMBERTB SET name =?, NICKNAME =?, USER_PASSWD =?, EMAIL =?, PHONE_NUM =? WHERE user_id =?";
	         psmt = con.prepareStatement(query);
	         
	         psmt.setString(1, name);
	         psmt.setString(2, nickname);
	         psmt.setString(3, user_passwd);
	         psmt.setString(4, email);
	         psmt.setString(5, phone_num);
	         psmt.setString(6, user_id);
	         rs = psmt.executeQuery();
	         System.out.println(query);
	         // 결과 처리
	         if (rs.next()) {
	            dto.setName(rs.getString("name"));
	            dto.setNickname(rs.getString("nickname"));
	            dto.setUser_passwd(rs.getString("user_passwd"));
	            dto.setEmail(rs.getString("email"));
	            dto.setPhone_num(rs.getString("phone_num"));
	            dto.setUser_id(rs.getString("user_id"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("회원 정보수정 중 오류 발생");
	      }

	      return dto; // DTO 객체 반환
	   }
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, dto.getName());
//			psmt.setString(2, dto.getNickname());
//			psmt.setString(3, dto.getUser_passwd());
//			psmt.setString(4, dto.getEmail());
//			psmt.setString(5, dto.getPhone_num());
//			psmt.setString(6, dto.getUser_id());
//
//			System.out.println(query);
//			result = psmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("개인정보 수정 중 예외 발생");
//			e.printStackTrace();
//		}
//		return result;
//	}

	// 탈퇴하기
	public int SignOut(int idx, String user_passwd) {
		String query = "DELETE FROM MEMBERTB WHERE idx=? and user_passwd=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			psmt.setString(2, user_passwd);
			rs = psmt.executeQuery();
			System.out.println(query);

		} catch (Exception e) {
			System.out.println("탈퇴 중 예외 발생");
			e.printStackTrace();
		}
		return 0;
	}
}