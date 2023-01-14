package kr.co.kico.dto;

public class BoardDTO {
	//Board
	private String bno;
	private String btitle;
	private String mno;
	private String bcnts;
	private String bdate;
	private String menuno;
	
	//Menu
	private String menuname;
	private String menuaccess;
	
	//Member (Board-Member)
	private String mid;
	private String mpwd;
	private String mname;
	private String mgno;
	
	//Member Group (Member-Group)
	private String mgname;
	private String before_menuaccess;

	public String getBeforeMenuaccess() {
		return before_menuaccess;
	}
	
	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getBcnts() {
		return bcnts;
	}

	public void setBcnts(String bcnts) {
		this.bcnts = bcnts;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getMenuno() {
		return menuno;
	}

	public void setMenuno(String menuno) {
		this.menuno = menuno;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getMenuaccess() {
		return menuaccess;
	}

	public void setMenuaccess(String menuaccess) {
		this.menuaccess = menuaccess;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMgno() {
		return mgno;
	}

	public void setMgno(String mgno) {
		this.mgno = mgno;
	}

	public String getMgname() {
		return mgname;
	}

	public void setMgname(String mgname) {
		this.mgname = mgname;
	}
}
