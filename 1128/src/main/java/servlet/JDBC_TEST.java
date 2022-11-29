/*
 * 자바 리소스에 작성
그 후 서블릿에 직접 작성*/

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;


// URL도 처음 세팅한 이름으로 되어 있음.

// JDBC : 자바가 데이터베이스에 커넥트하는 방법론을 의미
/* JDBC에는 5개의 단계가 존재
	1단계 : 드라이버 로딩
	2단계 : 커넥션을 연결하는 단계, 커넥션 연결시 URL, user, password 3가지 개념이 필요
	3단계 : 쿼리를 날리는 부분 -> 쿼리를 진술(query:DB에 보내는 질문 statement)한다
	4단계 : 결과 확인(insert, update, delete) : 성공 건수를 보냄. 
		예) 2줄이 insert되면 2가 넘어옴, select는 resultSet(DB의 외부 스키마)을 반환
	5단계 : connection close
*/

/* 외부 스키마
 * 데이터의 논리적, 물리적 종속성을 제거하기 위해 데이터베이스를 구성할 때 3단계의 스키마로 구성
 
 외부 스키마 : 우리 눈에 보여지는 상태 -> 테이블 모양의 결과값을 의미 
 내부 스키마 : hdd, ssd의 물리적으로 저장된 상태를 의미함 / 0과 1로 저장 
 개념 스키마 : 두 가지 개념을 switching 시키는 역할, 일종의 통로 역할
 
 resultSet : DB의 외부 스키마를 copy해 옴. 그래서 이를 옮기는 작업이 필요함. 
 보통 mybatis가 함.
 그래서 이 과정이 잘 안 보임. mybatis가 어느 정도의 일을 해주는 지 확인해야 함. 
 
 url, user, password는 context.xml에서 다 처리함.
 mybatis mapper 작성하면 쿼리만 다룸
 실제로 execute 쿼리를 하고 dto에 세팅하는 과정이 전부 mybatis가 자동화하고 있음.
 
 dbcp를 통해 connetion과 close가 이뤄짐.
 mybatis가 하는 역할을 확인할 수 있음.
 결과를 담아서 우리에게 줌.
 */

@WebServlet("/JDBC_TEST")
public class JDBC_TEST extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public JDBC_TEST() {
        super();
    }

    //exception도 override 해버려서 예외 처리가 필요함.
    //try - catch하면 지역변수가 적용됨. try문 안으로 넣으면 그 try 안에서만 사용 가능.
    //메소드 안에 있으므로 지역변수이긴 한데, 여기에 갇혀버리면 안 됨. con만 밖으로 빼야 됨.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//드라이버 이름. 클래스를 가져다가 메모리로 올려줌. 이 클래스를 못 찾으면 빨간 줄이 뜸
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//2
		String url = "jdbc:oracle:thin:@10.77.77.234:1521:xe"; //멤버변수로 놓아도 크게 의미없음
		String User = "c##scott";
		String Password = "tiger";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select deptno, dname from dept";
		ArrayList<DeptDTO> list = new ArrayList<DeptDTO>(); 
		
		try {
			conn = DriverManager.getConnection(url,User,Password); //전역변수로 하려고 위에서 따로 선언.
			//3 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query); //결과를 받아줌.
			//모두 쿼리를 담고 DB로 전달되는 것임. 기본적으로는 쿼리를 담아서 간다고 보면 됨.
			
			//4
			while(rs.next()) {//결과값이 있는 동안 loop 돌림
				/*rs 객체는 DB 메모리에 잡혀있는 외부 스키마를 투영해줌.
				 이걸 들고 어딘가로 갈 수 없음. 받아서 보내줘야 함.
				 rs => 외부 스키마, 데이터의 row를 지시하는 지시자가 따라 붙음
				 next라는 메소드를 호출하면 이 지시자가 한 칸 아래로 내려 옴
				 이 지시자가 가장 처음에 가리킨 것을 before_first
				 마지막에 있는 것을 After last라고 함.
				 그래서 before_first ~ After_last까지 이동.
				 데이터가 있으면 true를 리턴, 없으면 false를 리턴
				 그러면서 while문이 나가는 형태임.
				 */
				
				//System.out.println(rs.getString(1)); //숫자여도 string으로 받아짐
				//System.out.println(rs.getString(dept));
				//현장에서는 개발자와 관리자가 다른 사람이므로, dept로 써 놓음.
				//System.out.println(rs.getString("deptno"));
				//System.out.println(rs.getString("dname"));
				
				//부서 정보 1줄이 dto, 총 4개의 dto가 나옴.
				//그래서 이들을 담는 리스트가 필요
						
				//여기에 list 선언하면 지역변수, catch에서도 접근이 안 됨
				DeptDTO dto = new DeptDTO();
				dto.setDeptno(rs.getString("deptno"));
				dto.setDname(rs.getString("dname"));
				list.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			//5. close
			/* 에러가 나버리면 close를 안 거치고 종료함.
			 * 만약 close를 캐치문 안에 달았다면 에러 없이 수행되면 close를 안 하고 나감
			 * 그래서 finally에 넣어야 함.
			 */
			//close의 반대 방향으로 해줘야 함. rs 역순으로 해줘야 함.
			//안 그러면 미아가 되어버림...!
			
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			//close 시도했는데 rs가 없는 경우가 발생할 수 있음.
			//그래서 close도 또 예외처리 ㄱㄱ
			
			
			//소켓이 생성되면 소켓 안에 input, output string이 존재.
			//물리적으로는 톰캣이 가진 클라이언트와 연결한 소켓을 통해 데이터를 보내므로
			//이걸 호출하면 톰캣이 방출하는 output stream으로 연결
			response.setCharacterEncoding("EUC-KR");
			PrintWriter out = response.getWriter();
			out.print("조회성공 ^^"); 
			
			/*한글 살리는 방법
			 * 1. java output stream 조정
			 * 2. 걍 html노가다
			 * */
			
			for (DeptDTO deptDTO : list) {
				out.println(" ");
				out.print(deptDTO.getDeptno()+":"+deptDTO.getDname());
				out.println(" ");
			}
			
			
			out.close(); //자바 input, output의 경우 반드시 close를 동반해야 함
			
			//HttpSession se = request.getSession(); //세션 소환
			//세션은 톰캣에 붙는 순간 무조건 생기며, 1client당 1session
			//(같은 서버에 엣지, 크롬으로 접속하면 세션 2개 생성 - 즉 브라우저당 1개 생성)
			
			//se.setAttribute("jdbcTestList", list);
			/*
			 서블릿이어서 굳이 HttpSession(JSP)를 부를 필요가 없음.
			 세션에 담고 부르는 것이 아니라 여기에 바로 보내야 됨
			 */
			
		}//finally
	}
	
	/*
	 	이너 클래스의 명명 시 : $이너클래스명
	 	_의 경우 jsp -> java 변환 시 사용되므로 사용 X
	 	
	 	oracle_driver를 로딩
	 	ojdbc8은 실행 시 필요, 로딩 시 필요한 거 또 다름
	 	
	 	reference lib : 개발 시 필요
	 	ojdbc : 실행 시 필요
	 	
	 	.은 객체 내부, 폴더 내부의 경로
	 	
	 * */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
