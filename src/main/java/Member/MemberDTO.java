package Member;

public class MemberDTO {
	private int idx;
	private String name;
	private String nickname;
	private String user_id;
	private String user_passwd;
	private String email;
	private String phone_num;
	private int report;
	private String user_picture;

	public MemberDTO() {

	}

	public MemberDTO(int idx, String name, String nickname, String user_id, String user_passwd, String email,
			String phone_num, int report, String user_picture) {
		super();
		this.idx = idx;
		this.name = name;
		this.nickname = nickname;
		this.user_id = user_id;
		this.user_passwd = user_passwd;
		this.email = email;
		this.phone_num = phone_num;
		this.report = report;
		this.user_picture = user_picture;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_passwd() {
		return user_passwd;
	}

	public void setUser_passwd(String user_passwd) {
		this.user_passwd = user_passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getUser_picture() {
		return user_picture;
	}

	public void setUser_picture(String user_picture) {
		this.user_picture = user_picture;
	}

}
