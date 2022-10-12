package board.report;

import common.DBConnPool;

public class ReportDAO extends DBConnPool {

	public ReportDAO() {
		super();
	}

	public ReportDTO getReportDTO(int idx) {
		ReportDTO dto = new ReportDTO(); // 회원 정보 DTO 객체 생성
		String query = "SELECT * FROM reportTB WHERE idx=? ORDER BY report DESC";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			System.out.println(query);
			// 결과 처리
			if (rs.next()) {

				dto.setIdx(rs.getInt("idx"));
				dto.setReport(rs.getInt("report"));
				dto.setReporterIdx(rs.getInt("reporterIdx"));
				dto.setReason(rs.getString("reason"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신고 관리 테이블 조회 중 오류 발생");
		}

		return dto; // DTO 객체 반환
	}

	// 신고 접수
	   public int reportReceived(ReportDTO dto) {
	      int result = 0;

	      String query = "INSERT INTO reportTB (idx, report, reporterIdx, reason, reportDate) "
	            + "VALUES ( ?, (SELECT NVL(MAX(report),0)+1 FROM reportTB),?,?,sysdate)";

	      try {
	         psmt = con.prepareStatement(query);
	         psmt.setInt(1, dto.getIdx());
	         psmt.setInt(2, dto.getReporterIdx());
	         psmt.setString(3, dto.getReason());
	         result = psmt.executeUpdate();

	         System.out.println(query);
	      } catch (Exception e) {
	         System.out.println("신고 접수 중 예외 발생");
	         e.printStackTrace();
	      }
	      return result;
	   }

	// 한 회원을 한 번만 신고할 수 있게 하기
	public boolean reporterIdxCheck(int reporterIdx) {
		boolean check = false;
		try {
			String query = " SELECT * FROM reportTB WHERE reporterIdx=?";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, reporterIdx);
			rs = psmt.executeQuery();

			check = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신고자 중복확인 오류");

		} finally {
			close();
		}
		return check;
	}

}