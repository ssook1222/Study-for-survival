package servlet;

public class DeptDTO {

	private String deptno;
	private String dname;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return deptno+":"+dname;
	}
	
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
}//class
