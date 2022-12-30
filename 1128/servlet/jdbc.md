# JDBC


Java DataBase Connectivity의 약자로 JDBC는 자바 언어로 데이터베이스 프로그래밍을 하기 위한 라이브러리이다.

JDBC는 DBMS에 종속되지 않는 관련 API를 제공한다. 
JDBC API는 JDK에서 제공하며 JDBC 프로그래밍을 위해서는 JDBC드라이버가 필요하다.

JDBC 드라이버는 각 DBMS 회사에서 제공하는 라이브러리 압축파일이다.

- 데이터베이스를 연결하여 테이블 형태의 자료를 참조
- SQL 문을 질의
- SQL 문의 결과를 처리

---

resultSet : DB의 외부 스키마를 copy해 옴. 그래서 이를 옮기는 작업이 필요함.

> 외부 스키마 : 우리 눈에 보여지는 상태 → 테이블 모양의 결과값을 의미

> 내부 스키마 : hdd, ssd의 물리적으로 저장된 상태를 의미함 / 0과 1로 저장

> 개념 스키마 : 두 가지 개념을 switching 시키는 역할, 일종의 통로 역할

---

`dbcp`

클라이언트와 서버 사이드인 웹 어플리케이션에서, 
사용자의 요청에 따라 Connection이 생성된다면 수 많은 사용자가 요청을 했을 때 서버에 과부하가 걸리게 된다.

이러한 상황을 예방하기 위해 **미리 일정 갯수의 Connection을 만들어 Pool에 저장**을 하고,

**사용자의 요청이 발생하면 Connection을 제공**하고 **사용자와의 연결이 종료된다면 Pool에 다시 반환하여 보관하는 것**을 의미합니다.

즉, **Connection Pool**에 대해 정리하자면 다음과 같다.

- 여러 개의 DB Connection을 하나의 Pool에 모아놓고 관리
- DB 커넥션 객체를 여러 개 생성한 뒤 Pool에 담아놓고 필요할 때 불러와서 사용
- 만약, 빌려줄 수 있는 Connection이 없다면 Connection 객체가 반환할 때 까지 클라이언트는 대기 상태로 전환
- 사용이 끝난 커넥션 객체는 다른 작업에서 다시 사용할 수 있도록 Pool에 반환

---

### JDBC 5단계

**DO-GET 사용 시 주의할 점**

exception도 override 해버려서 예외 처리가 필요함.

try - catch하면 지역변수가 적용됨. try문 안으로 넣으면 그 try 안에서만 사용 가능.

메소드 안에 있으므로 지역변수이긴 한데, 여기에 갇혀버리면 안 됨.

---

1단계 : 드라이버 로딩

```jsx
Class.forName("oracle.jdbc.driver.OracleDriver");
```

드라이버 이름. 클래스를 가져다가 메모리로 올려줌. 이 클래스를 못 찾으면 빨간 줄이 뜸

oracle_driver를 로딩

ojdbc8은 실행 시 필요, 로딩 시 필요한 거 또 다름.

**reference lib : 개발 시 필요**

**ojdbc : 실행 시 필요**

---

2단계 : 커넥션을 연결하는 단계, 커넥션 연결시 URL, user, password 3가지 개념이 필요

```jsx
String url = "jdbc:oracle:thin:@10.77.77.234:1521:xe"; //멤버변수로 놓아도 크게 의미없음
String User = "c##scott";
String Password = "tiger";
```

---

3단계 : 쿼리를 날리는 부분 → 쿼리를 진술(query:DB에 보내는 질문 statement)한다

```jsx
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
		
String query = "select deptno, dname from dept";
```

---

4단계 : 결과 확인(insert, update, delete) : 성공 건수를 보냄.    
예) 2줄이 insert되면 2가 넘어옴, select는 resultSet(DB의 외부 스키마)을 반환

```jsx
ArrayList<DeptDTO> list = new ArrayList<DeptDTO>();
.
.
.
try{
.
.
.
while(rs.next()) {
DeptDTO dto = new DeptDTO();
				dto.setDeptno(rs.getString("deptno"));
				dto.setDname(rs.getString("dname"));
				list.add(dto);
}
}
```

결과값이 있는 동안 loop 돌림.

rs 객체는 DB 메모리에 잡혀있는 외부 스키마를 투영해줌.

이걸 들고 어딘가로 갈 수 없음. 받아서 보내줘야 함.

rs → 외부 스키마, 데이터의 row를 지시하는 지시자가 따라 붙음

next라는 메소드를 호출하면 이 지시자가 한 칸 아래로 내려 옴

이 지시자가 가장 처음에 가리킨 것을 before_first 마지막에 있는 것을 After last라고 함.

그래서 before_first ~ After_last까지 이동. 데이터가 있으면 true를 리턴, 없으면 false를 리턴 그러면서 while문이 나가는 형태임.

`DTO`

클래스를 만들고 > 좌측 상단 두 번째 클릭 > getter/setter method 생성하기로 쉽게 만들 수 있음.

```jsx
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
	
}
```

---

5단계 : connection close

```jsx
finally {
	try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
}
```

에러가 나버리면 close를 안 거치고 종료함.

만약 close를 캐치문 안에 달았다면 에러 없이 수행되면 close를 안 하고 나감.

그래서 finally에 넣어야 함.

소켓이 생성되면 소켓 안에 input, output string이 존재.

물리적으로는 톰캣이 가진 클라이언트와 연결한 소켓을 통해 데이터를 보내므로

이걸 호출하면 톰캣이 방출하는 output stream으로 연결

---

[참고한 블로그](https://zzang9ha.tistory.com/376)
