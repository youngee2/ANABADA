package board.report;

public class ReportDTO {
	private int idx;
	private int report;
	private int reporterIdx;
	private String reason;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public int getReporterIdx() {
		return reporterIdx;
	}

	public void setReporterIdx(int reporterIdx) {
		this.reporterIdx = reporterIdx;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}