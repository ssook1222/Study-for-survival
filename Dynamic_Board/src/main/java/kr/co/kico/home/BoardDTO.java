package kr.co.kico.home;

public class BoardDTO {
	//글 한 개 볼 때 게시판 이름이 다 떠야 되므로, 따로 만드느니 아예 다 만드는 게 나을 수도 있음.
	
	private String mno;
	private String bno;
	private String bdate;
	private String btitle;
	private String bpwd;
	private String bcnts;
	private String bwriter;
	private String mname;

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBpwd() {
		return bpwd;
	}

	public void setBpwd(String bpwd) {
		this.bpwd = bpwd;
	}

	public String getBcnts() {
		return bcnts;
	}

	public void setBcnts(String bcnts) {
		this.bcnts = bcnts;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
}
