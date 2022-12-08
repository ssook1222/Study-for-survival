package jsp;

public class MemberVO {
	
	//usebean을 사용하기 위함.
	
	//파라미터를 자동으로 세팅해서 맞춰주는데, dto(vo)의 변수와 화면 요소의 name이 동일해야 함.
	private String mid;
	private String mname;
	private String maddr;
	private String mtel;
	
	//toString은 자동으로 안 만들어지므로 직접 쳐서 넘어가야 함.
	//그 안에 있는 객체를 보기 위해서는 toString을 구현해야 함. (= Object를 상속받는 이유)
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	
}//class
