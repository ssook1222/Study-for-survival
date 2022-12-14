package kr.co.kico.mywork;

public class LoginDTO {

	private String mno;
	private String mid;
	private String mpwd;
	private String mname;
	
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
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
	
	@Override
	public String toString() {
		return "LoginDTO [mno=" + mno + ", mid=" + mid + ", mpwd=" + mpwd + ", mname=" + mname + "]";
	}
}
